import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/color.dart';
import 'package:uae_store/stateful/types_screen.dart';
import 'package:uae_store/stateless/qrcode_screen.dart';
import 'package:uae_store/stateless/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(8.h),
          child: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            elevation: 0.0,
            backgroundColor: AppColors.lightBlue,
            leading: IconButton(
              icon: Image.asset('assets/images/back-icon.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: SearchBar(
              searchController: _searchController,
              onSearchPressed: () {
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
            /*Container(
              margin: EdgeInsets.only(top: 1.h),
              width: MediaQuery.of(context).size.width,
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
              ),
              child: TextFormField(
                controller: _searchController,
                style: TextStyle(
                  fontFamily: 'Bukra-Regular',
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
                cursorColor: AppColors.lightBlue,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'بحث....',
                  hintStyle: const TextStyle(fontFamily: 'Bukra-Regular'),
                  hintTextDirection: TextDirection.rtl,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: IconButton(
                    icon: Image.asset('assets/images/search.png'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen(),
                        ),
                      );
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: IconButton(
                      icon: Image.asset('assets/images/barcode.png'),
                      onPressed: () {},
                      iconSize: 35,
                    ),
                    onPressed: () {
                      */
            /* Clear the search field */ /*
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0.5),
                  ),
                ),
              ),
            ),*/
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/search-big.png',
/*              height: 10.h,
                  width: 20.w,*/
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 6.h),
                Text(
                  'إبدأ بالبحث عن المنتجات',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
