import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/search_screen.dart';
import 'package:uae_store/stateless/inside_store.dart';
import 'package:uae_store/stateless/widgets/search_bar.dart';

import '../color.dart';

class TypesScreen extends StatefulWidget {
  const TypesScreen({Key? key}) : super(key: key);

  @override
  _TypesScreenState createState() => _TypesScreenState();
}

class _TypesScreenState extends State<TypesScreen> {
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
                  builder: (context) => InsideStore(),
                ),
              );
            },
          ),
          title: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white, fontSize: 14.sp, height: 0.19.h),
              children: [
                TextSpan(
                  text: 'كــارفــور\n',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                ),
                const TextSpan(text: 'خضروات & فواكه'),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
            ),
          ],
          bottom: Tab(
            height: 8.5.h,
            child: SearchBar(searchController: _searchController),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4.0,
                  child: Container(
                    padding: EdgeInsets.all(1.h),
                    height: 5.h,
                    width: 18.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'الكل',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.lightBlue),
                        ),
                        // SizedBox(width: 0.5.w),
                        Expanded(
                          child: Image.asset(
                            'assets/images/menu.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 2.5.w),
                CategoryTitleItem(title: 'خضروات', onTap: () {}),
                SizedBox(width: 2.5.w),
                CategoryTitleItem(title: 'فواكه', onTap: () {}),
              ],
            ),
            SizedBox(height: 1.5.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 4.w,
                    childAspectRatio: 1 / 1.1,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ProductItem(
                    onTap: () {
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
                  ),
                  itemCount: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTitleItem extends StatelessWidget {
  const CategoryTitleItem({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.all(1.h),
          alignment: Alignment.center,
          height: 5.h,
          width: 18.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: AppColors.grey),
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.onTap}) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 23.h,
      // width: 42.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5.h),
                  Image.asset('assets/images/lime-lemon.png'),
                  Expanded(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            onTap();
                          },
                          child: Container(
                            height: 4.h,
                            width: 18.w,
                            margin: EdgeInsets.only(top: 4.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              'إضافة',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 10.sp, height: 0.25.h),
                              children: [
                                const TextSpan(text: 'ليمون\n'),
                                TextSpan(
                                  text: '500 جم\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Colors.black26,
                                          fontSize: 8.sp),
                                ),
                                TextSpan(
                                  text: '120.00',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 9.sp, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'SR',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 9.sp, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -1.h,
                right: -1.5.w,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
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
