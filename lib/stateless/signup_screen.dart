import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/color.dart';
import 'package:uae_store/stateless/verify_screen.dart';
import 'package:uae_store/stateless/widgets/buttons.dart';
import 'package:uae_store/stateless/widgets/text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final emailOrNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/vector-abstract-shapes-left.png',
                height: 21.h,
                width: 45.w,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 7.5.w, top: 4.5.h),
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
              left: -60.w,
              child: SvgPicture.asset(
                'assets/images/white-container.svg',
                width: 165.w,
              ),
            ),
            Positioned(
              left: 1.1.w,
              top: 38.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.right,
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
                    SizedBox(height: 4.h),
                    Text(
                      'الرجاء التسجيل للإستمتاع بخدماتنا  ',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Bukra-Regular',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    TxtFormField(
                      hintText: 'موبايل أو بريد إلكتروني',
                      controller: emailOrNumberController,
                      keyboardType: TextInputType.emailAddress,
                      imgPath: 'assets/images/email.png',
                    ),
                    SizedBox(height: 1.h),
                    TxtFormField(
                      hintText: 'كلمة المرور',
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      imgPath: 'assets/images/padlock.png',
                    ),
                    SizedBox(height: 1.h),
                    TxtFormField(
                      hintText: 'تأكيد كلمة المرور',
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      imgPath: 'assets/images/padlock.png',
                    ),
                    SizedBox(height: 7.h),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: GeneralBtn(
                        label: 'تسجيل',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyScreen(),
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
