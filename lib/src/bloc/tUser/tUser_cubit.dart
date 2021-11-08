import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/repository/point_repository.dart';
import 'package:tickley/src/repository/tUser_repository.dart';

import 'tUser_state.dart';

class TUserCubit extends Cubit<TUserState> {
  final TUserRepository tUserRepository;
  final PointRepository pointRepository;

  TUserCubit({required this.tUserRepository, required this.pointRepository})
      : super(Empty());

  fetchUserDataMyPage() async {
    try {
      emit(Loading());

      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) throw Exception('Failed to get user data');

      final tUser = await this.tUserRepository.userLogin(user.uid);
      final point =
          await this.pointRepository.fetchCategoryPointsByUser(tUser.id);
      emit(Loaded(tUser: tUser, point: point));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
