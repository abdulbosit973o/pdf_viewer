import 'package:flutter/material.dart';
import 'package:pdf_viewer/features/main/presentation/screens/home/home_screen.dart';
import 'package:pdf_viewer/features/main/presentation/screens/main/main_screen.dart';
import 'package:pdf_viewer/features/main/presentation/screens/pdf_view/pdf_view_screen.dart';

import '../features/main/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String mainScreen = '/mainScreen';
  static const String homeScreen = '/homeScreen';
  static const String pdfViewScreen = '/pdfViewScreen';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Object? arg = settings.arguments;
    switch (settings.name) {
      case splashScreen:
        return customRoute(const SplashScreen());
      case mainScreen:
        return customRoute(const MainScreen());
      case pdfViewScreen:
        return customRoute(PdfViewerScreen(pdfPath: arg as String));
      case homeScreen:
        return customRoute(const HomeScreen());
    }
    return null;
  }

  static PageRouteBuilder customRoute(StatefulWidget screen) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const beginEnter = Offset(1, 0);
        const beginExit = Offset(-1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var enterTween =
            Tween(begin: beginEnter, end: end).chain(CurveTween(curve: curve));
        var exitTween =
            Tween(begin: end, end: beginExit).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(enterTween),
          child: SlideTransition(
            position: secondaryAnimation.drive(exitTween),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
    );
  }
}
