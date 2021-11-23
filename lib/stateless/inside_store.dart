import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/types_screen.dart';
import 'package:uae_store/stateless/widgets/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../color.dart';

class InsideStore extends StatelessWidget {
  InsideStore({Key? key}) : super(key: key);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(18.h),
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
                  builder: (context) => const TypesScreen(),
                ),
              );
            },
          ),
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white, fontSize: 10.sp, height: 0.22.h),
              children: [
                TextSpan(
                  text: 'كارفور\n',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white, fontSize: 15.sp, height: 0.2.h),
                ),
                const TextSpan(text: '60 mins '),
                const TextSpan(text: 'مدة التوصيل '),
              ],
            ),
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
            height: 10.h,
            child: Column(
              children: [
                SizedBox(height: 1.5.h),
                Expanded(child: SearchBar(searchController: _searchController)),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          children: [
            CarouselSlider(
              items: carouselImages
                  .map(
                    (item) => Image(
                      image: AssetImage(item),
                      fit: BoxFit.fill,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 25.h,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              flex: 2,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2.h,
                  crossAxisSpacing: 4.w,
                  childAspectRatio: 1 / 1.38,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const Item(),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> carouselImages = [
  'assets/images/fruits.png',
  'assets/images/fruits.png'
];

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Image.asset(
            'assets/images/chocolate.png',
            fit: BoxFit.fill,
            height: 14.h,
            width: 35.w,
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Text(
              'شيكولاتة',
              style: TextStyle(
                fontFamily: 'Bukra-Medium',
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
