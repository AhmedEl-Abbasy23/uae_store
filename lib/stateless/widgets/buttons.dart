import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/color.dart';

class GeneralBtn extends StatelessWidget {
  const GeneralBtn({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 9.h,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Bukra-Regular',
            fontSize: 14.sp,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
      ),
    );
  }
}

class TxtBtn extends StatelessWidget {
  const TxtBtn({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        label,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontFamily: 'Bukra-Regular',
          fontSize: 10.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
        ),
      ),
      style: TextButton.styleFrom(
        primary: AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
      ),
    );
  }
}
