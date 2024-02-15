import 'package:portfolio/email/email_api/email_model.dart';
import 'package:portfolio/email/failure/email_failure.dart';
import 'package:dartz/dartz.dart';

import 'email_api.dart';

abstract class EmailRepository {

  Future<Either<EmailFailure, Email>> sendEmail ({
    required String name,
    required String email,
    required String subject,
    required String message,
});
}

class EmailRepositoryImpl implements EmailRepository {
  EmailApi emailApi;

  EmailRepositoryImpl({
    required this.emailApi,
});

  Future<Either<EmailFailure, Email>> sendEmail ({
    required String name,
    required String email,
    required String subject,
    required String message,
}) async {
    try {
      final emailStatus = await emailApi.sendEmail(
        name: name,
        email: email,
        subject: subject,
        message: message,
      );

      print (emailStatus);
      return Right(emailStatus);

      } catch (e) {
      print(e.toString());

      if (e == EmailFailure.serverError()){
        return Left(EmailFailure.serverError());
      } else {
        return Left(EmailFailure.networkError());
      }
    }
  }
}

