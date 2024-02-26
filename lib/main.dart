import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';

import 'Screens/Splash/splash_screen.dart';
import 'Utils/device_util.dart';
import 'Utils/strings.dart';
import 'Utils/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  await DeviceUtil.instance.init();
  await GetStorage.init('augmont');
  runApp(const AugmontApp());
}

class AugmontApp extends StatelessWidget {
  const AugmontApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.goldForAll,
      theme: CustomTheme.lightTheme,
      home:const SplashScreen(),
      defaultTransition: Transition.rightToLeft,
    );
  }
}


