import 'package:cleanarchitecture/src/config/routes/app_routes.dart';
import 'package:cleanarchitecture/src/config/themes/app_theme.dart';
import 'package:cleanarchitecture/src/core/utils/constants.dart';
import 'package:flutter/material.dart';

import 'src/config/routes/app_routes.dart';
import 'src/config/themes/app_theme.dart';
import 'src/core/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitle,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
    );
  }
}
