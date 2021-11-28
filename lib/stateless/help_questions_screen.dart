import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_store/stateful/layout_screen.dart';

import '../color.dart';

class HelpQuestionsScreen extends StatelessWidget {
  const HelpQuestionsScreen({Key? key}) : super(key: key);

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
            icon: Image.asset('assets/images/back-icon.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                ),
              );
            },
          ),
          title: Text(
            'أسئلة المساعدة',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white, fontSize: 17.sp),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          children: const [
            QuestionExpansionTile(
              title: 'ما هو تطبيق UAE ؟',
              answerText: 'تطبيق يسمح للمستخدمين بطلب سريع لكافة المحال',
            ),
            QuestionExpansionTile(
              title: 'من أين احصل علي عروض جديدة ؟',
              answerText: 'يمكن الوصول للعروض الجديدة من الصفحة الرئيسية ومن الشريط أسفل التطبيق',
            ),
            QuestionExpansionTile(
              title: 'ما هي المدة المتوقعة للحصول على طلبي ؟',
              answerText: 'يمكن الوصول للعروض الجديدة من الصفحة الرئيسية ومن الشريط أسفل التطبيق',
            ),
            QuestionExpansionTile(
              title: 'كيف يتم حساب النقاط داخل التطبيق ؟',
              answerText: 'يمكن الوصول للعروض الجديدة من الصفحة الرئيسية ومن الشريط أسفل التطبيق',
            ),
            QuestionExpansionTile(
              title: 'ما هي وسائل الدفع المتوفرة ؟',
              answerText: 'يمكن الوصول للعروض الجديدة من الصفحة الرئيسية ومن الشريط أسفل التطبيق',
            ),
            QuestionExpansionTile(
              title: 'ما هو نقاط UAE ؟',
              answerText: 'يمكن الوصول للعروض الجديدة من الصفحة الرئيسية ومن الشريط أسفل التطبيق',
            ),
            QuestionExpansionTile(
              title: 'كيف يمكننى الطلب ؟',
              answerText: 'يمكن الوصول للعروض الجديدة من الصفحة الرئيسية ومن الشريط أسفل التطبيق',
            ),
            QuestionExpansionTile(
              title: 'ما هي طريقة الدفع المستخدمة ؟',
              answerText: 'يمكن الوصول للعروض الجديدة من الصفحة الرئيسية ومن الشريط أسفل التطبيق',
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionExpansionTile extends StatelessWidget {
  const QuestionExpansionTile(
      {Key? key, required this.title, required this.answerText})
      : super(key: key);

  final String title;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.3.h),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.symmetric(horizontal: 5.w),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        iconColor: AppColors.lightBlue,
        textColor: AppColors.lightBlue,
        collapsedTextColor: Colors.black,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          title,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: 'Bukra-Medium', fontSize: 12.sp),
        ),
        expandedAlignment: Alignment.centerRight,
        children: [
          Container(
            height: 6.h,
            alignment: Alignment.centerRight,
            child: Text(
              answerText,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.grey.withOpacity(0.6),
                    fontSize: 10.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
