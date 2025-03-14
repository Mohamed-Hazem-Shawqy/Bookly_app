import 'package:bookly_app/core/widgets/on_error_message.dart';
import 'package:bookly_app/core/widgets/on_loading.dart';
import 'package:bookly_app/features/home/presentation/manager/similiar_book_cubit/similiar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimiliarHorizontailList extends StatelessWidget {
  const SimiliarHorizontailList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimiliarBooksCubit, SimiliarBooksState>(
      builder: (context, state) {
        if (state is SimiliarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FeatureBookView(
                  imageUrl:
                      state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                          "",
                ),
              ),
            ),
          );
        } else if (state is SimiliarBooksFailuer) {
          return OnErrorMessage(errMessage: state.errMessage);
        } else {
          return const OnLoading();
        }
      },
    );
  }
}
