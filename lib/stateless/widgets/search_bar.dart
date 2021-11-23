import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.searchController}) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        bottom: 3.h,
      ),
      child: TextFormField(
        controller: searchController,
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
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: Image.asset('assets/images/barcode.png'),
            onPressed: () {},
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          ),
        ),
      ),
    );
  }
}
