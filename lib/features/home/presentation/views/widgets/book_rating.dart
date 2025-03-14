import 'package:bookly_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.pageCount,
    required this.publishDate,
  });
  final MainAxisAlignment mainAxisAlignment;
  final int pageCount;
  final String publishDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 14,
        ),
        const SizedBox(width: 6.3),
        Text(
          "$pageCount",
          style: Style.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Opacity(
          opacity: .6,
          child: Text(
            "($publishDate)",
            style: Style.textStyle16,
          ),
        ),
      ],
    );
  }
}
