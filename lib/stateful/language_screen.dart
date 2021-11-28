import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../color.dart';
import 'layout_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var selected = 0;

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
                  builder: (context) => const LayoutScreen(),
                ),
              );
            },
          ),
          title: Text(
            'اللغه',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontSize: 17.sp,
                ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Change app language
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              height: 7.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: selected == 0 ? AppColors.lightBlue : Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: selected != 0 ? Colors.black : Colors.transparent,
                ),
              ),
              child: RadioListTile(
                value: 0,
                groupValue: selected,
                onChanged: (val) {
                  setState(() {
                    // selected = val;
                  });
                },
                title: Text(
                  'العربية',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12.sp,
                        color: selected == 0 ? Colors.white : Colors.black,
                      ),
                ),
                activeColor: Colors.white,
                selectedTileColor: AppColors.lightBlue,
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              height: 7.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: selected == 1 ? AppColors.lightBlue : Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: selected != 1 ? Colors.black : Colors.transparent,
                ),
              ),
              child: RadioListTile(
                value: 1,
                groupValue: selected,
                onChanged: (val) {
                  setState(() {
                    // selected = val;
                  });
                },
                title: Text(
                  'الإنجليزية',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12.sp,
                        color: selected == 1 ? Colors.white : Colors.black,
                      ),
                ),
                activeColor: Colors.white,
                selectedTileColor: AppColors.lightBlue,
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            // Image
            Image.asset('assets/images/language-learning.png'),
          ],
        ),
      ),
    );
  }
}
