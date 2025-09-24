import 'dart:typed_data';

import 'package:hsbc/features/home/domain/entities/sign_model.dart';

abstract class SignRepo {
  Future<SignModel?> getSignItem(String uuid);

  Future<void> uploadSign(Uint8List file, String userId, String signId);
}
