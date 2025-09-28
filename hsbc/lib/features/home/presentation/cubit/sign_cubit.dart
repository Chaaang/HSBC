import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hsbc/features/home/domain/repo/sign_repo.dart';
import 'package:hsbc/features/home/presentation/cubit/sign_state.dart';

import '../../../event/domain/entities/event.dart';

class SignCubit extends Cubit<SignState> {
  final SignRepo signRepo;

  String? _currentSignId;
  Event? _currentEvent;
  SignCubit({required this.signRepo}) : super(SignInitial());

  Future<void> getCurrentEvent(Event event) async {
    _currentEvent = event;
    _currentSignId = _currentEvent!.id;
    emit(SignLoading());
    try {
      if (_currentEvent != null) {
        //emit(SignLoaded(_currentEvent));
        emit(SignBoxHide(_currentEvent));
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

      //await getCurrentEvent(_currentEvent!);
      emit(SignBoxHide(_currentEvent));
    } catch (e) {
      emit(SignError(e.toString()));
    }
  }

  String? get currentSignId => _currentSignId;

  Future<void> hideSignBox() async {
    if (state is SignBoxHide) {
      emit(SignLoaded(_currentEvent));
    } else if (state is SignLoaded) {
      emit(SignBoxHide(_currentEvent));
    }
  }
}
