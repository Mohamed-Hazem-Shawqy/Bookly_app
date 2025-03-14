import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/widgets/on_error_message.dart';
import 'package:bookly_app/core/widgets/on_loading.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRoutes.kBookDetails,
                      extra: state.books[index],
                    );
                  },
                  child: FeatureBookView(
                      imageUrl: state
                          .books[index].volumeInfo!.imageLinks!.thumbnail!),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBookFailuer) {
          return OnErrorMessage(errMessage: state.errMessage);
        } else {
          return const OnLoading();
        }
      },
    );
  }
}
