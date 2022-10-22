import 'package:flutter/material.dart';
import 'package:fontend_fmarket/fonts/app_styles.dart';


class LargeIconButton extends StatelessWidget {
  const LargeIconButton({
    Key? key,
    required this.buttonName,
    required this.iconImage,
  }) : super(key: key);

  final String buttonName, iconImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () {},

      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        // height: 30,
        child: Row(
          children: [
            SizedBox(
              width: 0,
            ),
            Expanded(
              flex: 1,
              child: Container(
                // height: 25,
                child: Image.asset(iconImage),
              ),
            ),
            // SizedBox(
            //   width: 10,
            // ),
            Expanded(
              flex: 3,
              child: Text(
                buttonName,
                style: AppStyles.h1.copyWith(fontSize:20),
              ),
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
