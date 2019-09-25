import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
	@override
	CategoryState get initialState => InitialCategoryState();
	
	@override
	Stream<CategoryState> mapEventToState(CategoryEvent event
	                                      ) async* {
		// TODO: Add your event logic
	}
}
