import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:movieapp/common/screenutil/screnutil.dart';

class ThemeText {
  ThemeText._();

  static TextTheme get _poppingsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 =>
      _poppingsTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: Colors.white,
      );
  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
      );
}
