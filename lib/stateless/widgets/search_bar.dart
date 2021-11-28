import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchController,
    required this.onSearchPressed,
    required this.onBarcodePressed,
  }) : super(key: key);

  final TextEditingController searchController;
  final Function onSearchPressed;
  final Function onBarcodePressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      child: TextFormField(
        controller: searchController,
        style: TextStyle(
          fontFamily: 'Bukra-Regular',
          color: Colors.black,
          fontSize: 12.sp,
        ),
        cursorColor: AppColors.lightBlue,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: 'بحث....',
          hintStyle: const TextStyle(fontFamily: 'Bukra-Regular', height: 0.5),
          hintTextDirection: TextDirection.rtl,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: IconButton(
            icon: Image.asset('assets/images/search.png'),
            onPressed: () {
              onSearchPressed();
            },
          ),
          suffixIcon: IconButton(
            icon: Image.asset('assets/images/barcode.png'),
            onPressed: () {
              onBarcodePressed();
            },
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
