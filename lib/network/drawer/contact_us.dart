import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class SendEmailApi {
  static const link = 'https://api.emailjs.com/api/v1.0/email/send';
  static const serviceId = "service_dga8ga8"; // service_dga8ga8
  static const templateId = "template_kibj8m3"; //template_kibj8m3
  static const userId = "kdJ4pcQ38XFqx54Lk"; //kdJ4pcQ38XFqx54Lk

  static Future sendEmailData({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      String url = link;
      Uri uri = Uri.parse(url);
      var headers = {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        },
      });
      log("Response:: SendEmailResponse\nUrl:: $url\nheaders:: ${headers.toString()}");
      http.Response response = await http.post(uri, headers: headers, body: body);
      log("SendEmailStatusCode:: ${response.statusCode} SendEmailBody:: ${response.body}");
      if (response.statusCode == 200) {
        log("SendEmailStatusCode:: ${response.statusCode} SendEmailBody:: ${response.body}");
        return response;
      } else {
        log("SendEmailStatusCode:: ${response.statusCode} SendEmailBody:: ${response.body}");
        return null;
      }
    } catch (e) {
      log("$e");
      return null;
    }
  }
}
