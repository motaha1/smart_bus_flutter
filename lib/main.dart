import 'package:bus/presentation/home/home.dart';
import 'package:bus/presentation/map/map.dart';
import 'package:bus/presentation/splash_screen/splash_screen.dart';
import 'package:bus/provider/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/app_export.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
   // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (context) {
          return AuthProvider();
        },
      ),

    ], child: AppInit());
  }
}
class AppInit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'bus',
      home: MapScreen(),
       builder: EasyLoading.init(),
       //initialBinding: InitialBindings(),
      // initialRoute: AppRoutes.initialRoute,
     // getPages: AppRoutes.pages,
    );
  }
}
