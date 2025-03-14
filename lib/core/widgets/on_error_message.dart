import 'package:bookly_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class OnErrorMessage extends StatelessWidget {
  const OnErrorMessage({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Style.textStyle20,
      ),
    );
  }
}
