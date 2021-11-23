import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/complete_order_screen.dart';
import 'package:uae_store/stateful/favorite_screen.dart';
import 'package:uae_store/stateful/language_screen.dart';
import 'package:uae_store/stateful/orders_screen.dart';
import 'package:uae_store/stateful/search_screen.dart';
import 'package:uae_store/stateful/shopping_cart_screen.dart';
import 'package:uae_store/stateful/types_screen.dart';
import 'package:uae_store/stateless/app_info_screen.dart';
import 'package:uae_store/stateless/delivery_details_screen.dart';
import 'package:uae_store/stateless/help_questions_screen.dart';
import 'package:uae_store/stateless/joinus_screen.dart';
import 'package:uae_store/stateless/notifications_screen.dart';
import 'package:uae_store/stateless/profile_screen.dart';
import 'package:uae_store/stateless/qrcode_screen.dart';
import 'package:uae_store/stateless/splash_screen.dart';
import 'package:uae_store/stateless/terms_conditions_screen.dart';

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
            home: HelpQuestionsScreen(),
          ),
        );
      },
    );
  }
}
