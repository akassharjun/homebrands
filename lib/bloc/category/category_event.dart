part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  CategoryEvent([List props = const []]) : super(props);
}

class FetchCategoryList extends CategoryEvent {}
