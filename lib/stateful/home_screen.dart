import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/search_screen.dart';
import 'package:uae_store/stateless/inside_store.dart';
import 'package:uae_store/stateless/qrcode_screen.dart';
import 'package:uae_store/stateless/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: AppBar(
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            child: SearchBar(
              searchController: _searchController,
              onSearchPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
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
                // All Method
                onPressedAll: () {},
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemExtent: 155.0,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                    child: Item(
                      onItemTapped: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InsideStore(),
                          ),
                        );
                      },
                    ),
                  ),
                  itemCount: 10,
                ),
              ),
              FieldType(
                name: 'مدينتك',
                // All Method
                onPressedAll: () {},
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 6.w,
                    childAspectRatio: 1 / 1.10,
                  ),
                    physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Item(
                    onItemTapped: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InsideStore(),
                        ),
                      );
                    },
                  ),
                  itemCount: 8,
                ),
              ),
            ],
          ),
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
  const Item({Key? key, required this.onItemTapped}) : super(key: key);
  final Function onItemTapped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemTapped();
      },
      child: Stack(
        children: [
          Image.asset(
            'assets/images/pexels-daria-shevtsova.png',
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
              margin: EdgeInsets.symmetric(horizontal: 0.w),
              alignment: Alignment.center,
              height: 8.h,
              // width: MediaQuery.of(context).size.width,
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
