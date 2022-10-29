import 'package:flutter/material.dart';

import '../design/app_styles.dart';
class BoxDecorationCate extends StatelessWidget {
  final Color background;
  final String title;
  final String image;
  const BoxDecorationCate(
      {Key? key,
        required this.background,
        required this.title,
        required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),


      width: 346,
      height: 100,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.white, width: 10),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: const Color(0xFF0B0C2A).withOpacity(.09),
                offset: const Offset(10, 10))
          ]),
      child: Row( children: [
        const SizedBox(height: 16),
        Padding(padding: EdgeInsets.only(left: 15),
            child: Image.asset(image,
              width: 100,
              height:100,

            )
        ),
        Padding(padding: EdgeInsets.only(left: 50),
          child: Text(title, style: AppStyles.m12w,),
          // Text(subtitle, style: AppStyles.r10wt),
        )]),
    );
  }
}