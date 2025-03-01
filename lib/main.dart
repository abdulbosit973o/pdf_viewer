import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_viewer/config/theme/app_theme.dart';
import 'package:pdf_viewer/core/extensions/custom_functions.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription _intentSub;
  final _sharedFiles = <SharedMediaFile>[];
  SharedMediaFile? pdf;

  @override
  void initState() {
    super.initState();
    toggleNightMode(false);
    // Ilova ochiq holatda yangi media kelganda ishlaydi
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
      });

      _openPdfIfAvailable();
    }, onError: (err) {
      print("getIntentDataStream error: $err");
    });

    // Ilova yopiq holatda kelgan media
    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);

        // Intentni qayta ishlashni to‘xtatamiz
        ReceiveSharingIntent.instance.reset();
      });

      _openPdfIfAvailable();
    });
  }

  // PDF mavjud bo‘lsa, uni shu joyda ochish, aks holda boshqa ekran ochish
  void _openPdfIfAvailable() {
    if (_sharedFiles.isNotEmpty) {
      for (var file in _sharedFiles) {
        logD(file.toString());
        if (file.type == SharedMediaType.file && file.path.endsWith(".pdf")) {
          setState(() {
            pdf = file; // PDF fayl yo‘lini saqlaymiz
          });
          return;
        }
      }
    }
    // Agar PDF bo‘lmasa, boshqa sahifa ochish
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text("No PDF Found")),
        body: Center(child: Text("Ulashilgan fayl PDF emas!")),
      ),
    ));
  }

  @override
  void dispose() {
    _intentSub.cancel();
    super.dispose();
  }

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  bool _nightMode = false;
  Icon? lightBulb;

  void toggleNightMode(bool toggle) {
    switch (toggle) {
      case true:
        setState(() {
          _nightMode = false;
          lightBulb = Icon(Icons.lightbulb_outline, color: Colors.white);
        });
        break;

      case false:
        setState(() {
          _nightMode = true;
          lightBulb = Icon(Icons.lightbulb_outline, color: Colors.yellow);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: false,
        designSize: MediaQuery.sizeOf(context),
        builder: (context, child) {
          return MaterialApp(
            themeMode: ThemeMode.system,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.theme,
            home: Scaffold(
              floatingActionButton: FloatingActionButton(
                  child: lightBulb,
                  onPressed: () => toggleNightMode(_nightMode)),
              appBar: AppBar(
                title: Text(pdf == null
                    ? 'PDF Viewer App'
                    : pdf!.thumbnail ?? pdf!.message ?? 'PDF Viewer'),
                actions: [
                  Text(
                    "$currentPage/$pages",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 16),
                  )
                ],
              ),
              body: pdf != null
                  ? Stack(
                      children: [
                        PDFView(
                          filePath: pdf!.path,
                          enableSwipe: true,
                          swipeHorizontal: false,
                          autoSpacing: false,
                          pageFling: false,
                          nightMode: currentPage == 10,
                          onRender: (totalPages) {
                            setState(() {
                              pages = totalPages;
                              isReady = true;
                            });
                          },
                          onError: (error) {
                            print(error.toString());
                          },
                          onPageError: (page, error) {
                            print('$page: ${error.toString()}');
                          },
                          onViewCreated: (PDFViewController pdfViewController) {
                            _controller.complete(pdfViewController);
                          },
                          onPageChanged: (int? page, int? total) {
                            setState(() {
                              currentPage = page;
                            });
                            print('page change: $page/$total');
                          },
                        ),
                      ],
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Shared files:"),
                          if (_sharedFiles.isNotEmpty)
                            Text(_sharedFiles.map((f) => f.path).join("\n")),
                          if (_sharedFiles.isEmpty)
                            Text("Hali hech qanday fayl ulashilmadi."),
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
