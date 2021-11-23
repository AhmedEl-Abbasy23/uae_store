import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/color.dart';

class TxtFormField extends StatelessWidget {
  const TxtFormField({
    Key? key,
    required this.controller,
    required this.imgPath,
    required this.hintText,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;

  // final IconData icon;
  final String imgPath;
  final String hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.w,
      height: 5.h,
      child: TextFormField(
        textAlign: TextAlign.end,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        style: TextStyle(
          fontFamily: 'Bukra-Regular',
          fontSize: 12.sp,
        ),
        cursorColor: AppColors.lightBlue,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12.sp,
          ),
          suffixIcon: Image.asset(imgPath),
        ),
      ),
    );
  }
}
