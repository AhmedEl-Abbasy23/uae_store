import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/language_screen.dart';
import 'package:uae_store/stateful/layout_screen.dart';
import 'package:uae_store/stateless/app_info_screen.dart';
import 'package:uae_store/stateless/help_questions_screen.dart';
import 'package:uae_store/stateless/joinus_screen.dart';
import 'package:uae_store/stateless/terms_conditions_screen.dart';

import '../color.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          // Icons & Logo.
          isLogin
              ?
              // if user logged in.
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue.withOpacity(0.31),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'أهلاً بك',
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: AppColors.lightBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17.sp,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset('assets/images/logo2.png'),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 20.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue.withOpacity(0.31),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            RichText(
                              textDirection: TextDirection.rtl,
                              text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                children: [
                                  TextSpan(
                                    text: 'أهلاً بك',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: AppColors.lightBlue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp,
                                        ),
                                  ),
                                  const TextSpan(
                                    text: '.... سجل الدخول\nواستمتع بخدماتنا',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.5.h),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 5.h,
                                  width: 26.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlue,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Text(
                                    'تسجيل الدخول',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                'إنشاء حساب',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: AppColors.lightBlue,
                                    ),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.lightBlue),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/logo2.png'),
                    ],
                  ),
                ),
          SizedBox(height: 2.h),
          Column(
            children: [
              if (isLogin)
                ProfileCategory(
                  title: 'أبراج بحيرة جميرا',
                  leadingImgPath: 'assets/images/place2.png',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LayoutScreen(),
                      ),
                    );
                  },
                ),
              ProfileCategory(
                title: 'عن التطبيق',
                leadingImgPath: 'assets/images/info-button.png',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppInfoScreen(),
                    ),
                  );
                },
              ),
              ProfileCategory(
                title: 'أسئلة المساعدة',
                leadingImgPath: 'assets/images/question.png',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpQuestionsScreen(),
                    ),
                  );
                },
              ),
              ProfileCategory(
                title: 'الشروط والأحكام',
                leadingImgPath: 'assets/images/terms-and-conditions.png',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndConditionsScreen(),
                    ),
                  );
                },
              ),
              ProfileCategory(
                title: 'اللغة',
                leadingImgPath: 'assets/images/world.png',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LanguageScreen(),
                    ),
                  );
                },
              ),
              ProfileCategory(
                title: 'إنضم إلينا كمتجر',
                leadingImgPath: 'assets/images/help.png',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JoinUsScreenScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileCategory extends StatelessWidget {
  const ProfileCategory(
      {Key? key,
      required this.title,
      required this.leadingImgPath,
      required this.onTap})
      : super(key: key);

  final String title;
  final String leadingImgPath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 8.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 0.7.h),
      child: ListTile(
        onTap: () {
          onTap();
        },
        title: Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 12.sp),
          ),
        ),
        leading: Container(
          width: 4.w,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/back-icon.png',
            color: AppColors.grey.withOpacity(0.5),
          ),
        ),
        trailing: Container(
          width: 7.w,
          alignment: Alignment.center,
          child: Image.asset(leadingImgPath),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
      ),
    );
  }
}
