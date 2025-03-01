import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/style/text_styles.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    ThemeData base = ThemeData.light();

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.backgroundLight,
      cardColor: Colors.white,
      textTheme: base.textTheme.copyWith(
        displayLarge: pbold.copyWith(color: AppColors.midnightBlue),
        displayMedium: pbold.copyWith(color: AppColors.midnightBlue),
        displaySmall: pbold.copyWith(color: AppColors.midnightBlue),
        headlineMedium: pbold.copyWith(color: AppColors.midnightBlue),
        headlineSmall: pbold.copyWith(color: AppColors.midnightBlue),
        titleLarge: pbold.copyWith(color: AppColors.midnightBlue),
        titleMedium: psemiBold.copyWith(color: AppColors.midnightBlue),
        titleSmall: psemiBold.copyWith(color: AppColors.midnightBlue),
        bodyLarge: pmedium.copyWith(color: AppColors.midnightBlue),
        bodyMedium: pmedium.copyWith(color: AppColors.midnightBlue),
        bodySmall: pmedium.copyWith(color: Color(0xff757575)),
        // Oldingi bodySmall
        labelLarge: psemiBold.copyWith(color: AppColors.midnightBlue),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: pbold.copyWith(
          fontSize: 18,
          color: AppColors.midnightBlue,
        ),
        elevation: 10,
        contentTextStyle: pmedium.copyWith(
          fontSize: 16,
          color: AppColors.midnightBlue,
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        todayBackgroundColor: MaterialStateProperty.all(AppColors.primary),
        headerBackgroundColor: AppColors.appBarLight,
        backgroundColor: AppColors.backgroundLight,
        dayStyle: pmedium.copyWith(
          fontSize: 16,
          color: AppColors.midnightBlue,
        ),
        headerHelpStyle: pmedium.copyWith(
          fontSize: 16,
          color: AppColors.midnightBlue,
        ),
        headerHeadlineStyle: pbold.copyWith(
          fontSize: 24,
          color: AppColors.midnightBlue,
        ),
        weekdayStyle: pbold.copyWith(
          fontSize: 14,
          color: AppColors.midnightBlue,
        ),
        yearStyle: pmedium.copyWith(
          fontSize: 16,
          color: AppColors.midnightBlue,
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColors.midnightBlue,
          textStyle: pbold.copyWith(fontSize: 16), // Matn uslubi
          backgroundColor: AppColors.appBarLight, // Tugma foni
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColors.midnightBlue,
          textStyle: pmedium.copyWith(fontSize: 16),
          backgroundColor: AppColors.backgroundLight,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
      primaryColor: AppColors.primary,
      brightness: Brightness.light,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 12,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
      ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.primary,
          cursorColor: AppColors.primary,
          selectionHandleColor: AppColors.primary),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarLight,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.midnightBlue),
        centerTitle: true,
        toolbarHeight: 56.h,
        elevation: 0,
        titleTextStyle: psemiBold.copyWith(
          color: AppColors.midnightBlue,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    ThemeData base = ThemeData.dark();
    return base.copyWith(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      cardColor: Colors.black,
      dialogTheme: DialogTheme(
        backgroundColor: Colors.black,
        titleTextStyle: pbold.copyWith(
          fontSize: 18,
          color: AppColors.white,
        ),
        contentTextStyle: pmedium.copyWith(
          fontSize: 16,
          color: AppColors.white,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.primary,
          cursorColor: AppColors.primary,
          selectionHandleColor: AppColors.primary),
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        elevation: 12,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarDark,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        scrolledUnderElevation: 0,
        toolbarHeight: 56.h,
        iconTheme: const IconThemeData(color: AppColors.white),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: psemiBold.copyWith(
          color: AppColors.white,
          fontSize: 18,
        ),
      ),
      textTheme: base.textTheme.copyWith(
        displayLarge: pbold.copyWith(color: AppColors.white),
        displayMedium: pbold.copyWith(color: AppColors.white),
        displaySmall: pbold.copyWith(color: AppColors.white),
        headlineMedium: pbold.copyWith(color: AppColors.white),
        headlineSmall: pbold.copyWith(color: AppColors.white),
        titleLarge: pbold.copyWith(color: AppColors.white),
        titleMedium: psemiBold.copyWith(color: AppColors.white),
        titleSmall: psemiBold.copyWith(color: AppColors.white),
        bodyLarge: pmedium.copyWith(color: AppColors.white),
        bodyMedium: pmedium.copyWith(color: AppColors.white),
        bodySmall: pmedium.copyWith(color: Color(0xffcdcdcd)),
        // Oldingi bodySmall
        labelLarge: psemiBold.copyWith(color: AppColors.white),
      ),
      datePickerTheme: DatePickerThemeData(
        todayBackgroundColor: MaterialStateProperty.all(AppColors.primary),
        todayForegroundColor: MaterialStateProperty.all(AppColors.white),
        headerBackgroundColor: AppColors.appBarDark,
        backgroundColor: AppColors.backgroundDark,
        dayStyle: pmedium.copyWith(
          fontSize: 16,
          color: AppColors.white,
        ),
        headerHelpStyle: pmedium.copyWith(
          fontSize: 16,
          color: AppColors.white,
        ),
        headerHeadlineStyle: pbold.copyWith(
          fontSize: 24,
          color: AppColors.white,
        ),
        weekdayStyle: pbold.copyWith(
          fontSize: 14,
          color: AppColors.white,
        ),
        yearStyle: pmedium.copyWith(
          fontSize: 16,
          color: AppColors.white,
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColors.white,
          textStyle: pbold.copyWith(fontSize: 16), // Matn uslubi
          backgroundColor: AppColors.appBarDark, // Tugma foni
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColors.white,
          textStyle: pmedium.copyWith(fontSize: 16),
          backgroundColor: AppColors.backgroundDark,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
