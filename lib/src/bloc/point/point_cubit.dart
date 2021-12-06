import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/repository/point_repository.dart';

import 'point_state.dart';

class PointCubit extends Cubit<PointState> {
  final PointRepository repository;

  PointCubit({required this.repository}) : super(Empty());

  fetchAllUserPoint() async {
    try {
      emit(Loading());

      final point = await this.repository.fetchAllUserPoint();
      final userLength = await this.repository.fetchUserLength();

      emit(Loaded(point: point, userLength: userLength));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
