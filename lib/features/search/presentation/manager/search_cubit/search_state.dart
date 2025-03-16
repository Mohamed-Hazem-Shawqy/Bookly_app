part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchSucess extends SearchState {
  final List<BookModel> books;

  const SearchSucess({required this.books});
}
final class SearchFailuer extends SearchState {
  final String errMessage;

  const SearchFailuer( this.errMessage);
}
final class SearchLoading extends SearchState {}
