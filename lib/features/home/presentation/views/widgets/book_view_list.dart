import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_text.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_book_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookViewList extends StatelessWidget {
  const BookViewList({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRoutes.kBookDetails,
          extra: bookModel,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 130,
              child: FeatureBookView(
                imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? "",
              )),
          const SizedBox(width: 30),
          BestSellerText(
            bookmodel: bookModel,
          ),
        ],
      ),
    );
  }
}
