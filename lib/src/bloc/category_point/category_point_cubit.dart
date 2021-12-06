import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category_point/category_point_state.dart';
import 'package:tickley/src/repository/point_repository.dart';

class CategoryPointCubit extends Cubit<CategoryPointState> {
  final PointRepository repository;

  CategoryPointCubit({required this.repository}) : super(Empty());

  fetchCategoryPoints() async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchCategoryPoints();
      final points = resp;

      emit(Loaded(points: points));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
