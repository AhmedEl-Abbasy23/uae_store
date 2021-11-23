import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/complete_order_screen.dart';
import 'package:uae_store/stateful/shopping_cart_screen.dart';

import '../color.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  DeliveryDetailsScreen({Key? key}) : super(key: key);
  final locationController = TextEditingController();
  final flatNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final moreInformationController = TextEditingController();

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShoppingCartScreen(),
                ),
              );
            },
          ),
          title: Text(
            'تفاصيل التوصيل',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
        child: Column(
          children: [
            // Text Form Fields.
            Column(
              children: [
                CustomTextFF(
                  textController: locationController,
                  hintText: 'الموقع ( مثلا اسم المبنى - رقم الشارع )',
                ),
                CustomTextFF(
                  textController: flatNumberController,
                  hintText: 'رقم الشقة / البيت',
                ),
                CustomTextFF(
                  textController: phoneNumberController,
                  hintText: 'رقم الهاتف',
                  hintDirection: TextDirection.ltr,
                  textDirection: TextDirection.ltr,
                ),
                CustomTextFF(
                  textController: emailController,
                  hintText: 'البريد الإلكتروني',
                  textDirection: TextDirection.ltr,
                ),
                CustomTextFF(
                  textController: nameController,
                  hintText: 'الاسم',
                ),
                CustomTextFF(
                  textController: moreInformationController,
                  hintText: 'تعليمات خاصة بالعنوان ( إختيارى )',
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 8.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompleteOrderScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'تأكيد',
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
  }) : super(key: key);
  final TextEditingController textController;
  final String hintText;
  TextDirection? hintDirection;
  TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9.h,
      margin: EdgeInsets.symmetric(vertical: 0.4.h),
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
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: 'Bukra-Regular', fontSize: 10.sp),
          hintTextDirection: hintDirection ?? TextDirection.rtl,
          contentPadding:
          EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.w),
          filled: true,
          fillColor: AppColors.lightGrey,
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
