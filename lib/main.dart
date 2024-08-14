import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_logic.dart';

import 'package:travelapp/services/data_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlacesProvider()),
      ],
    //  child: MyApp(),
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    ),
    //MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          color: Colors.white,
       
          title: 'Travel App',
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: AnimatedSplashScreen(
            splash: 'assets/images/logo.jfif',
            splashIconSize: 300.sp,
            nextScreen: BlocProvider<AppCubits>(
              create: (context) => AppCubits(
                data: DataServices(),
              ),
              child: AppCubitLogics(),
            ),
            splashTransition: SplashTransition.fadeTransition,
          ),
        );
      },
    );
  }
}
