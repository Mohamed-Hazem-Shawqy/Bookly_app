import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/text_style.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BestSellerText extends StatelessWidget {
  const BestSellerText({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Text(
              bookmodel.volumeInfo?.title??"No title",
              style: Style.textStyle20.copyWith(
                fontFamily: kGTSectraFineRegular,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            bookmodel.volumeInfo!.authors?[0]??"Unknown authors",
            style: Style.textStyle14,
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Free",
                style: Style.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              BookRating(
                pageCount: bookmodel.volumeInfo?.pageCount??10,
                publishDate: bookmodel.volumeInfo?.publishedDate??"12",
              )
            ],
          ),
        ],
      ),
    );
  }
}
