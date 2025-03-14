part of 'featured_book_cubit.dart';

sealed class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

final class FeaturedBookInitial extends FeaturedBookState {}

final class FeaturedBookLoading extends FeaturedBookState {}

final class FeaturedBookFailuer extends FeaturedBookState {
  final String errMessage;

  const FeaturedBookFailuer(this.errMessage);
}

final class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> books;

  const FeaturedBookSuccess(this.books);
}
