import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/routes/app_routes_file.dart';
import 'package:go_connect/utils/appSize.dart';
import 'package:go_connect/utils/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: true,
      right: true,
      left: true,
      top: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: themeDataLight,
          defaultTransition: Transition.noTransition,
          getPages: appRouteFile,
          initialRoute: AppRoutes.navbar, //AppRoutes.startingScreens,
          // home: CarCard(),
        ),
      ),
    );
  }
}
