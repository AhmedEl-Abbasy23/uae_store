import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/layout_screen.dart';

import '../color.dart';

class JoinUsScreenScreen extends StatelessWidget {
  JoinUsScreenScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppColors.lightBlue,
          leading: IconButton(
            icon: Image.asset('assets/images/back-icon.png'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                ),
              );
            },
          ),
          title: Text(
            'إنضم إلبنا',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white, fontSize: 17.sp),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 4.w,bottom: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'ابق على اتصال معنا',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColors.grey.withOpacity(0.6), fontSize: 12.sp),
                  ),
                  SizedBox(height: 2.h),
                  const MailAndPhoneItem(
                    text: 'البريد الإلكتروني:',
                    imgPath: 'assets/images/email2.png',
                  ),
                  const MailAndPhoneItem(
                    text: 'رقم الجوال:',
                    imgPath: 'assets/images/phone-call.png',
                  ),
                ],
              ),
            ),
            // Text Form Fields.
            Column(
              children: [
                CustomTextFF(
                  textController: nameController,
                  hintText: 'الاسم',
                ),
                CustomTextFF(
                  textController: phoneNumberController,
                  hintText: 'الجوال',
                ),
                CustomTextFF(
                  textController: emailController,
                  hintText: 'البريد الإلكتروني',
                  textDirection: TextDirection.ltr,
                ),
                CustomTextFF(
                  textController: messageController,
                  hintText: 'الرسالة',
                  messageField: true,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 8.h,
                child: ElevatedButton(
                  onPressed: () {
                    /*Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompleteOrderScreen(),
                      ),
                    );*/
                  },
                  child: Text(
                    'إرسال',
                    style: TextStyle(
                      fontFamily: 'Bukra-Regular',
                      fontSize: 15.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFF extends StatelessWidget {
  CustomTextFF({
    Key? key,
    required this.textController,
    required this.hintText,
    this.hintDirection,
    this.textDirection,
    this.messageField,
  }) : super(key: key);
  final TextEditingController textController;
  final String hintText;
  TextDirection? hintDirection;
  TextDirection? textDirection;
  bool? messageField;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.8.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: TextFormField(
        controller: textController,
        style: TextStyle(
          fontFamily: 'Bukra-Regular',
          color: Colors.black,
          fontSize: 12.sp,
        ),
        cursorColor: AppColors.lightBlue,
        textDirection: textDirection ?? TextDirection.rtl,
        maxLines: messageField != null ? 4 : 1,
        decoration: InputDecoration(
          hintText: hintText,
          alignLabelWithHint: true,
          hintStyle: TextStyle(fontFamily: 'Bukra-Regular', fontSize: 10.sp),
          hintTextDirection: hintDirection ?? TextDirection.rtl,
          filled: true,
          fillColor: AppColors.lightGrey,
          contentPadding:
              EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.w),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}

class MailAndPhoneItem extends StatelessWidget {
  const MailAndPhoneItem({Key? key, required this.text, required this.imgPath})
      : super(key: key);

  final String text;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.rtl,
        children: [
            Image.asset(
              imgPath,
              height: 3.h,
              width: 8.w,
            ),
          Expanded(
            child: Text(
              text,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.lightBlue,
                    fontSize: 11.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
