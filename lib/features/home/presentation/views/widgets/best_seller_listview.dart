import 'package:bookly_app/core/widgets/on_error_message.dart';
import 'package:bookly_app/core/widgets/on_loading.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_book_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_view_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is FeaturedNewestBookSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: BookViewList(
                  bookModel: state.books[index],
                )),
            itemCount: state.books.length,
          );

        } else if (state is FeaturedNewestBookFailuer) {
          return OnErrorMessage(errMessage: state.errMessage);
        } else {
          return const OnLoading();
        }
      },
    );
  }
}
// ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             padding: EdgeInsets.zero,
//             itemBuilder: (context, index) => Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: BookViewList(
//                   bookModel: state.books[index],
//                 )),
//             itemCount: state.books.length,
//           );

///////////


// SliverList(delegate: SliverChildBuilderDelegate((context,index)=>Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: BookViewList(
//                   bookModel: state.books[index],
//                 )),
//             childCount: state.books.length,));