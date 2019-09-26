import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/services/network_service.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  @override
  CategoryState get initialState => InitialCategoryState();
  
  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategoryList) {
      yield* _mapCategoryListToState();
    }
  }

  Stream<CategoryState> _mapCategoryListToState() async* {
    yield NetworkBusyCategoryState();
    try {
      // network call
      NetworkService networkService = NetworkService();
      CategoryList categoryList = await networkService.getCatergories();
      yield CategoryListFetchedCategoryState(
          categoryList: categoryList.categories);
    } catch (error, stacktrace) {
      yield NetworkErrorCategoryState(error: error.toString());
    }
  }
}
