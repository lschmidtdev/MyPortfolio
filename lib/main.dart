import 'package:portfolio/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app_theme.dart';

import 'package:layout/layout.dart';
import 'package:portfolio/pages/home/home_page.dart';
import 'package:portfolio/routes/routes.dart';
import 'package:portfolio/utils/values/values.dart';

// Contact
// TODO:: Fix email service
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.homePageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}