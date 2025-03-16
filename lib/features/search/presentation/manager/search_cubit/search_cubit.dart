import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

final SearchRepo searchRepo;
  Future<void> getSearchResult(String categoryName) async {
    emit(SearchLoading());
    var result = await searchRepo.getSearchResult(categoryName:categoryName );
    result.fold((failure) {
      return emit(
        SearchFailuer( failure.errMessage),
      );
    }, (books) {
      return emit(
       SearchSucess(books: books)
      );
    });
  }
}
