import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/color.dart';
import 'package:uae_store/stateful/shopping_cart_screen.dart';
import 'package:uae_store/stateless/inside_store.dart';
import 'package:uae_store/stateless/notifications_screen.dart';
import 'package:uae_store/stateless/profile_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'favorite_screen.dart';
import 'home_screen.dart';
import 'orders_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _screenIndex = 0;

  late PageController _pageController;

  int itemsInCart = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavyBarItem> bottomNavBarItems = [
      _bottomNavyBarItem(
          context: context,
          title: 'الرئيسية',
          imgPath: 'assets/images/home-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: 'طلباتي',
          imgPath: 'assets/images/list-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: 'المفضلة',
          imgPath: 'assets/images/love-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: 'البروفايل',
          imgPath: 'assets/images/user-icon.png'),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
            appBarTitles[_screenIndex],
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: [
            IconButton(
              icon: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset('assets/images/bag2.png'),
                  CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    radius: 6.0,
                    child: Text(
                      itemsInCart.toString(),
                      style: TextStyle(fontSize: 8.sp),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingCartScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _screenIndex = index);
            },
            children: screens,
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          showElevation: true,
          // use this to remove appBar's elevation
          selectedIndex: _screenIndex,
          onItemSelected: (index) {
            setState(() {
              _screenIndex = index;
            });
            /*_pageController.jumpToPage(
              index
            );*/
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          items: bottomNavBarItems,
        ),
      ),
    );
  }
}

List<Widget> screens = [
  HomeScreen(),
  const OrdersScreen(),
  const FavoriteScreen(),
  ProfileScreen(),
];

List<String> appBarTitles = const [
  'أبراج بحيرة جميرا',
  'طلباتي',
  'المفضلة',
  'الصفحة الشخصية',
];

BottomNavyBarItem _bottomNavyBarItem({
  required BuildContext context,
  required String imgPath,
  required String title,
}) {
  return BottomNavyBarItem(
    icon: Image.asset(imgPath),
    title: Text(
      title,
      style: Theme.of(context).textTheme.subtitle1,
    ),
    activeColor: AppColors.skyBlue,
    inactiveColor: AppColors.grey,
  );
}
