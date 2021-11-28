import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uae_store/stateful/layout_screen.dart';
import 'package:uae_store/stateful/shopping_cart_screen.dart';
import 'package:uae_store/stateful/types_screen.dart';
import 'package:uae_store/stateless/qrcode_screen.dart';
import 'package:uae_store/stateless/widgets/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../color.dart';

class InsideStore extends StatefulWidget {
  InsideStore({Key? key}) : super(key: key);

  @override
  State<InsideStore> createState() => _InsideStoreState();
}

class _InsideStoreState extends State<InsideStore> {
  final _searchController = TextEditingController();

  CarouselController carouselController = CarouselController();

  int _currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.h),
        child: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppColors.lightBlue,
          leading: IconButton(
            icon: Image.asset('assets/images/back-icon.png'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
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
          bottom: Tab(
            height: 8.h,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: SearchBar(
                searchController: _searchController,
                onSearchPressed: () {},
                onBarcodePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentImage = index;
                    });
                  }),
            ),
            // Indicators
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 39.w),
              height: 1.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carouselImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    height: 1.h,
                    width: _currentImage == index ? 4.w : 2.w,
                    decoration: BoxDecoration(
                      color:
                          _currentImage == index ? Colors.black : Colors.black12,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  );
                },
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
                itemBuilder: (context, index) => InsideItems(onItemTapped: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TypesScreen(),
                    ),
                  );
                }),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> carouselImages = [
  'assets/images/fruits.png',
  'assets/images/fruits.png',
  'assets/images/fruits.png',
];

final List<Widget> indicators = [
  CircleAvatar(
    backgroundColor: Colors.black,
  ),
  CircleAvatar(
    backgroundColor: Colors.black,
  ),
  CircleAvatar(
    backgroundColor: Colors.black,
  ),
];

class InsideItems extends StatelessWidget {
  const InsideItems({Key? key, required this.onItemTapped}) : super(key: key);
  final Function onItemTapped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemTapped();
      },
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
