import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category/category_state.dart';
import 'package:tickley/src/repository/category_repository.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository repository;

  CategoryCubit({required this.repository}) : super(Empty());

  fetchCategories() async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchCategories();

      final categories = resp;

      emit(Loaded(categories: categories));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
