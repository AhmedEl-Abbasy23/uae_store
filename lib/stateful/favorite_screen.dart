import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/shopping_cart_screen.dart';
import 'package:uae_store/stateless/notifications_screen.dart';

import '../color.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
            'المفضلة',
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
                    builder: (context) => ShoppingCartScreen(),
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
            addToBasket: () {
              final alert = AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/tick.png'),
                    SizedBox(height: 3.h),
                    Text(
                      'تمت إضافة منتج إلى السلة',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15.sp),
                    ),
                  ],
                ),
              );
              showDialog(
                context: context,
                builder: (context) {
                  return alert;
                },
              );
            },
          );
        },
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem(
      {Key? key, required this.productCount, required this.addToBasket})
      : super(key: key);

  final int productCount;
  final Function addToBasket;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      height: 18.h,
      child: Card(
        child: Row(
          children: [
            // Read & Delete icons
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 3.w),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: AppColors.lightBlue,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 2.w),
                      Expanded(
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
                      SizedBox(width: 2.w),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15.0),
                          onTap: () {
                            addToBasket();
                          },
                          child: Container(
                            height: 5.h,
                            width: 24.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              'إضافة إلي السلة',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            // Texts
            Expanded(
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
                          text: 'كارفور\n',
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.sp,
                            color: Colors.black,
                            height: 0.2.h
                          ),
                        ),
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
