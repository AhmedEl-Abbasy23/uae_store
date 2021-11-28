import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/color.dart';
import 'package:uae_store/stateful/home_screen.dart';
import 'package:uae_store/stateful/layout_screen.dart';
import 'package:uae_store/stateless/signup_screen.dart';
import 'package:uae_store/stateless/widgets/buttons.dart';
import 'package:uae_store/stateless/widgets/text_form_field.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({Key? key}) : super(key: key);

  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/vector-abstract-shapes-right.png',
                height: 21.h,
                width: 45.w,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 7.5.w, top: 4.5.h),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 25.h,
                  width: 50.w,
                ),
              ),
            ),
            Positioned(
              top: 18.h,
              bottom: -10.h,
              right: -60.w,
              child: SvgPicture.asset(
                'assets/images/white-container.svg',
                width: 162.5.w,
              ),
            ),
            Positioned(
              right: 1.1.w,
              top: 38.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: const [
                          TextSpan(
                            text: 'أهلآ بك في تطبيق\n',
                            style: TextStyle(color: AppColors.grey),
                          ),
                          TextSpan(
                            text: 'UAE STORE',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                        style: TextStyle(
                            fontFamily: 'Bukra-Regular',
                            height: 0.2.h,
                            fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'الرجاء كتابة رمز التحقق',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Bukra-Regular',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    TxtFormField(
                      hintText: 'رمز التحقق',
                      controller: codeController,
                      imgPath: 'assets/images/padlock.png',
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.only(right: 30.w),
                      child: GeneralBtn(
                        label: 'تحقق',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LayoutScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
