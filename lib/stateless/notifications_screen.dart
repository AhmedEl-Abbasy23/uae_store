import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/orders_screen.dart';
import 'package:uae_store/stateful/types_screen.dart';

import '../color.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

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
              Navigator.pop(context);
            },
          ),
          title: Text(
            'الإشعارات',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return NotificationItem(
            onTap: () {
              /*Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const //ScreenName,
              ),
            );*/
            },
          );
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0.5.h),
        height: 16.h,
        child: Card(
          child: Row(
            children: [
              // Read & Delete icons
              Expanded(
                child: Container(
                  color: AppColors.lightGrey,
                  child: Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/look.png'),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/trash.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Texts
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'هايبر وان',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'دبي',
                      style: Theme.of(context).textTheme.bodyText2!,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'تمت إضافة منتج خضروات جديد',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black, fontSize: 9.sp),
                    ),
                  ],
                ),
              ),
              // Circle & time.
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'منذ دقيقتين',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(height: 1.h),
                      CircleAvatar(
                        radius: 35,
                        child: Container(
                          padding: EdgeInsets.all(1.h),
                          height: 30.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35.0),
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Image.asset(
                            'assets/images/almahalawy.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
