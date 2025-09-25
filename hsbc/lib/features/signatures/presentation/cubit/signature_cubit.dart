import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsbc/features/signatures/domain/repo/signature_repo.dart';
import 'package:hsbc/features/signatures/presentation/cubit/signature_state.dart';

class SignatureCubit extends Cubit<SignatureState> {
  final SignatureRepo signatureRepo;
  SignatureCubit({required this.signatureRepo})
    : super(SignatureInitialState());

  Future<void> getSignatures(String signId) async {
    try {
      emit(SignatureLoadingState());

      final items = await signatureRepo.getSignatures(signId);

      if (items.isNotEmpty) {
        emit(SignatureLoadedState(items));
      } else {
        emit(SignatureEmptyState());
      }
    } catch (e) {
      emit(SignatureErrorState(e.toString()));
    }
  }
}
