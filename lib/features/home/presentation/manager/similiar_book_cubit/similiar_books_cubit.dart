import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similiar_books_state.dart';

class SimiliarBooksCubit extends Cubit<SimiliarBooksState> {
  SimiliarBooksCubit(this.homeRepo) : super(SimiliarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimiliarBooks({required String category}) async {
    emit(SimiliarBooksLoading());
    var result = await homeRepo.fetchSimiliarBooks(category: category);
    result.fold((failure) {
      return emit(
        SimiliarBooksFailuer(failure.errMessage),
      );
    }, (books) {
      return emit(
        SimiliarBooksSuccess(books),
      );
    });
  }
}
