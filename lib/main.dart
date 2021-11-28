import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/favorite_screen.dart';
import 'package:uae_store/stateful/home_screen.dart';
import 'package:uae_store/stateful/layout_screen.dart';
import 'package:uae_store/stateful/types_screen.dart';
import 'package:uae_store/stateless/help_questions_screen.dart';
import 'package:uae_store/stateless/inside_store.dart';
import 'package:uae_store/stateless/login_screen.dart';
import 'package:uae_store/stateless/notifications_screen.dart';
import 'package:uae_store/stateless/profile_screen.dart';
import 'package:uae_store/stateless/signup_screen.dart';
import 'package:uae_store/stateless/splash_screen.dart';

import 'color.dart';

void main() {
  runApp(
    // DevicePreview(
    // enabled: !kReleaseMode,
    // builder: (context) =>
    const MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: AppColors.lightBlue,
              ),
              textTheme: TextTheme(
                // for appBar title
                bodyText1: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Bukra-Medium',
                    fontSize: 17.sp),
                bodyText2: TextStyle(
                  fontFamily: 'Bukra-Regular',
                  fontSize: 10.sp,
                ),
                subtitle1: TextStyle(
                  color: AppColors.lightBlue,
                  fontFamily: 'Segoe-Ui',
                  fontSize: 15.sp,
                ),
              ),
            ),
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
