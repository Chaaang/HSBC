import 'package:hsbc/features/signatures/domain/entities/signature_url.dart';

abstract class SignatureRepo {
  Future<List<SignatureUrl>> getSignatures(String signId);
}
