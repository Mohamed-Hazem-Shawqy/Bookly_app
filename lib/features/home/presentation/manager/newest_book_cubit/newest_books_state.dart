part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class FeaturedNewestBookLoading extends NewestBooksState {}

final class FeaturedNewestBookFailuer extends NewestBooksState {
  final String errMessage;

  const FeaturedNewestBookFailuer(this.errMessage);
}

final class FeaturedNewestBookSuccess extends NewestBooksState {
  final List<BookModel> books;

  const FeaturedNewestBookSuccess(this.books);
}
