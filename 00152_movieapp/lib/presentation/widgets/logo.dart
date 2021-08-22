import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:movieapp/common/screenutil/screnutil.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({Key? key, required this.height})
      : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }
}
