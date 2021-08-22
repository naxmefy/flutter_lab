import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/presentation/jouneys/home/home_screen.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 986),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primaryColor: ThemeColor.vulcan,
          scaffoldBackgroundColor: ThemeColor.vulcan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
