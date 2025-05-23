part of 'similiar_books_cubit.dart';

sealed class SimiliarBooksState extends Equatable {
  const SimiliarBooksState();

  @override
  List<Object> get props => [];
}

final class SimiliarBooksInitial extends SimiliarBooksState {}
final class SimiliarBooksLoading extends SimiliarBooksState {}
final class SimiliarBooksFailuer extends SimiliarBooksState {
  final String errMessage;

  const SimiliarBooksFailuer(this.errMessage);
}
final class SimiliarBooksSuccess extends SimiliarBooksState {
  final List<BookModel> books;

  const SimiliarBooksSuccess(this.books);
}
