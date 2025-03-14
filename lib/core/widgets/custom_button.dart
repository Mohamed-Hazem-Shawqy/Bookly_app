import 'package:bookly_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backGroundColor,
    required this.textColor,
    this.bordeRaduis,
    required this.text,
    this.fontSize, this.onPressed,
  });

  final Color backGroundColor;
  final Color textColor;
  final BorderRadius? bordeRaduis;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: bordeRaduis ?? BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Style.textStyle18.copyWith(
                color: textColor,
                fontWeight: FontWeight.w800,
                fontSize: fontSize),
          )),
    );
  }
}
