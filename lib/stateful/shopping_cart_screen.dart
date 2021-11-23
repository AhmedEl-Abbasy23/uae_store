import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/complete_order_screen.dart';
import 'package:uae_store/stateless/delivery_details_screen.dart';
import 'package:uae_store/stateless/notifications_screen.dart';

import '../color.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
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
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
          title: Text(
            'عربة التسوق',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 4.h),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ),
              ),
              height: 70.h,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const OrderItem(productCount: 1);
                      },
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        Text(
                          '250.00 SR',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontSize: 10.sp,
                              ),
                        ),
                        const Spacer(),
                        Text(
                          'المجموع الكلي',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontSize: 10.sp,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryDetailsScreen(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 25.0,
                    child: Container(
                      padding: EdgeInsets.all(1.h),
                      height: 30.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Image.asset(
                        'assets/images/back-icon.png',
                        color: AppColors.lightBlue,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.h),
                Expanded(
                  child: Text(
                    'تفاصيل عربة التسوق',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16.sp,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.productCount}) : super(key: key);

  final int productCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18.h,
      child: Card(
        child: Row(
          children: [
            // Delete icon
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Image.asset('assets/images/trash.png'),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
            ),
            // Texts
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  RichText(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 9.sp,
                            height: 0.30.h,
                            color: Colors.black,
                          ),
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
                  SizedBox(height: 1.h),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        height: 5.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      // productCount
                      Align(
                        alignment: const Alignment(0.46, 0),
                        child: Text(
                          productCount.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      // removeIcon
                      Positioned(
                        left: 21.w,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15.0),
                          onTap: () {},
                          child: Card(
                            elevation: 1.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 5.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // addIcon
                      Positioned(
                        right: -1.w,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15.0),
                          onTap: () {},
                          child: Card(
                            elevation: 1.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 5.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Product image
            Container(
              padding: EdgeInsets.all(1.h),
              height: 15.h,
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
