import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'Routes/routes.dart';
import 'Screens/Splash/splash_screen.dart';
import 'Utils/device_util.dart';
import 'Utils/strings.dart';
import 'Utils/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DeviceUtil.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.goldForAll,
      theme: CustomTheme.lightTheme,
      initialRoute: SplashScreen.routeName,
      getPages: routeList,
      defaultTransition: Transition.rightToLeft,
    );
  }
}


