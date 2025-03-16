import 'package:bookly_app/core/widgets/on_error_message.dart';
import 'package:bookly_app/core/widgets/on_loading.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSucess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Image.network(
                    state.books[index].volumeInfo?.imageLinks?.thumbnail ?? ""),
                title: Text(state.books[index].volumeInfo?.title ?? 'No Title'),
              ),
            ),
            itemCount: state.books.length,
          );
        } else if (state is SearchFailuer) {
          return OnErrorMessage(errMessage: state.errMessage);
        } else {
          return const OnLoading();
        }
      },
    );
  }
}
