import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  CustomRichText({Key? key,this.title,this.data}) : super(key: key);
  String? title;
  String? data;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title!,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Your App Font Family',
        ),
        children: [
          TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            text: data!,
          ),
        ],
      ),
    );
  }
}
