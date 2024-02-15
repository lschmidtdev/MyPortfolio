import 'dart:convert';
import 'package:portfolio/email/failure/email_failure.dart';
import 'package:http/http.dart' as http;
import '../../utils/values/values.dart';
import 'email_model.dart';

abstract class EmailApi {

  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
});
}

class EmailApiImpl implements EmailApi {
  final http.Client client;

  EmailApiImpl({required this.client});

  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final response = await client.post(
        Uri.parse(StringConst.BASE_URL + StringConst.GET_IN_TOUCH_POINT),

        body: jsonEncode({
          "name": name,
          "email": email,
          "subject": subject,
          "message": message,
        }),
      );

      if (response.statusCode == 200){
        return Email(status: "sucess");
      } else {
        throw EmailFailure.serverError();
      }
    } catch(e) {
      print ("Error ${e.toString()}");
      throw EmailFailure.serverError();
    }
  }
}