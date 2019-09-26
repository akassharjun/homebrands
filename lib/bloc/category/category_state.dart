part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  CategoryState([List props = const []]) : super(props);
}

class InitialCategoryState extends CategoryState {}

class NetworkErrorCategoryState extends CategoryState {
  final String error;

  NetworkErrorCategoryState({this.error});
}

class NetworkBusyCategoryState extends CategoryState {}

class CategoryListFetchedCategoryState extends CategoryState {
  final List<Category> categoryList;

  CategoryListFetchedCategoryState({this.categoryList}) : super([categoryList]);

  bool get hasData => categoryList.length > 0;

  @override
  String toString() => 'CategoryListFetchedCategoryState';
}
