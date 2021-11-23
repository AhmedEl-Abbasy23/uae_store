import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/color.dart';
import 'package:uae_store/stateful/favorite_screen.dart';
import 'package:uae_store/stateless/widgets/buttons.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            Container(
              height: 20.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Scan QR code',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'قم بالمسح علي المنتج\nلمعرفة التفاصيل',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: AppColors.grey,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(child: Image.asset('assets/images/barcode-min.png')),
            SizedBox(height: 12.h),
            SizedBox(
              width: 45.w,
              height: 7.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteScreen(),
                    ),
                  );
                },
                child: Text(
                  'scan',
                  style: TextStyle(
                    fontFamily: 'Bukra-Regular',
                    fontSize: 15.sp,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
