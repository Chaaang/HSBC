import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hsbc/features/home/domain/repo/sign_repo.dart';
import 'package:hsbc/features/home/presentation/cubit/sign_state.dart';

class SignCubit extends Cubit<SignState> {
  final SignRepo signRepo;

  String? _currentSignId;
  String? _currentUserId;
  SignCubit({required this.signRepo}) : super(SignInitial());

  Future<void> getSignItem(String uuid) async {
    _currentUserId = uuid;
    try {
      emit(SignLoading());
      final item = await signRepo.getSignItem(uuid);

      if (item != null) {
        _currentSignId = item.id;
        emit(SignLoaded(item));
      }
    } catch (e) {
      emit(SignError(e.toString()));
    }
  }

  Future<void> saveSignatureBase64(
    Uint8List file,
    String userId,
    String signId,
  ) async {
    try {
      emit(SignLoading());

      await signRepo.uploadSign(file, userId, signId);

      await getSignItem(_currentUserId!);
    } catch (e) {
      emit(SignError(e.toString()));
    }
  }

  String? get currentSignId => _currentSignId;
}
