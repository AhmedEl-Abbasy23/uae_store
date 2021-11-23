import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateless/notifications_screen.dart';
import 'package:uae_store/stateless/qrcode_screen.dart';

import '../color.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
            icon: Image.asset('assets/images/bell1.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
          title: Text(
            'طلباتي',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: [
            IconButton(
              icon: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset('assets/images/bag2.png'),
                  const CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    radius: 6.0,
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return OrderItem(
            productCount: 3,
            onReorderTap: () {},
          );
        },
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem(
      {Key? key, required this.productCount, required this.onReorderTap})
      : super(key: key);

  final int productCount;
  final Function onReorderTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      height: 18.h,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 3.w, top: 1.h),
                        child: Text(
                          'منذ يومين',
                          textAlign: TextAlign.left,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 8.sp,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      onReorderTap();
                    },
                    child: Container(
                      height: 3.5.h,
                      width: 23.w,
                      // margin: EdgeInsets.only(top: 4.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        'إعادة الطلب',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trash.png'),
                  ),
                ],
              ),
            ),
            // Texts
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  RichText(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 9.sp, height: 0.25.h, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'بيبسي\n',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                        ),
                        const TextSpan(text: '120.00'),
                        const TextSpan(text: 'SR'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          height: 5.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: AppColors.lightBlue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.34, 0),
                          child: Text(
                            productCount.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(-0.25, 0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15.0),
                            onTap: () {},
                            child: Container(
                              height: 5.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(1, 0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15.0),
                            onTap: () {},
                            child: Container(
                              height: 5.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Circle & time.
            Container(
              padding: EdgeInsets.all(1.h),
              height: 20.h,
              width: 28.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Image.asset(
                'assets/images/pepsi.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
