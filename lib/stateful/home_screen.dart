import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/color.dart';
import 'package:uae_store/stateless/inside_store.dart';
import 'package:uae_store/stateless/widgets/search_bar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _searchController = TextEditingController();
  int _screenIndex = 0;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    List<BottomNavyBarItem> bottomNavBarItems = [
      _bottomNavyBarItem(
          context: context,
          title: 'الرئيسية',
          imgPath: 'assets/images/home-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: 'القائمة',
          imgPath: 'assets/images/list-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: 'المفضلة',
          imgPath: 'assets/images/love-icon.png'),
      _bottomNavyBarItem(
          context: context,
          title: 'الملف الشخصي',
          imgPath: 'assets/images/user-icon.png'),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(18.h),
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
                    builder: (context) => InsideStore(),
                  ),
                );
              },
            ),
            title: Text(
              'أبراج بحيرة جميرا',
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
                onPressed: () {},
              ),
            ],
            bottom: Tab(
              height: 70..h,
              child: SearchBar(searchController: _searchController),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 1.5.h, left: 3.5.w, right: 3.5.w),
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                FieldType(
                  name: 'مقترح إليك',
                  onPressedAll: () {},
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemExtent: 145,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                      child: const Item(),
                    ),
                    itemCount: 10,
                  ),
                ),
                FieldType(
                  name: 'مدينتك',
                  onPressedAll: () {},
                ),
                Expanded(
                  flex: 3,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.h,
                      crossAxisSpacing: 7.w,
                      childAspectRatio: 1 / 1.27,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => const Item(),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          showElevation: true,
          // use this to remove appBar's elevation
          selectedIndex: _screenIndex,
          onItemSelected: (index) {
            //missing setState Method
            // setState((){}),
            _screenIndex = index;
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

class FieldType extends StatelessWidget {
  const FieldType({Key? key, required this.onPressedAll, required this.name})
      : super(key: key);

  final Function onPressedAll;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Bukra-Medium',
              fontSize: 14.sp,
            ),
          ),
          TextButton(
            child: Text(
              'الكل',
              style: TextStyle(
                fontFamily: 'Bukra-Medium',
                fontSize: 12.sp,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {
              onPressedAll();
            },
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Image.asset(
            'assets/images/pexels-daria-shevtsova.png',
            fit: BoxFit.contain,
          ),
          Container(
            margin: EdgeInsets.only(top: 1.3.h, left: 2.w),
            alignment: Alignment.center,
            height: 2.5.h,
            width: 16.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              '60 mins',
              style: TextStyle(
                  fontFamily: 'Bukra-Regular',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0.5.w),
              alignment: Alignment.center,
              height: 8.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Text(
                'هايبر وان',
                style: TextStyle(
                    fontFamily: 'Bukra-Medium',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
