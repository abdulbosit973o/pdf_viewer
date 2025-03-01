import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfViewerScreen extends StatefulWidget {
  final String pdfPath;

  const PdfViewerScreen({super.key, required this.pdfPath});


  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer")),
      body: SfPdfViewer.file(File(widget.pdfPath)),
    );
  }
}
