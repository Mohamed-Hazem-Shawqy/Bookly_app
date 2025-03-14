import 'package:bookly_app/core/utils/text_style.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_book_list.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const BookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .12),
          child: FeatureBookView(
            imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? "",
          ),
        ),
        Text(
          bookModel.volumeInfo?.title ?? "No title",
          style: Style.textStyle20,
          textAlign: TextAlign.center,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo?.authors?[0] ?? "Unkown authors",
            style: Style.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          pageCount: bookModel.volumeInfo!.pageCount!,
          publishDate: bookModel.volumeInfo!.publishedDate!,
        ),
        const SizedBox(height: 37),
        BookAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
