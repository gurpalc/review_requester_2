import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class SendEmailReqestsCall {
  static Future<ApiCallResponse> call({
    String clientEmail = '',
    String message = '',
  }) {
    final body = '''
{
  "From": "donotreply@rr-app.me",
  "To": "${clientEmail}",
  "Subject": "Review Request",
  "TextBody": "${message}",
  "HtmlBody": "<html><body>${message} </body></html>",
  "MessageStream": "outbound"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmailReqests',
      apiUrl: 'https://api.postmarkapp.com/email',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Postmark-Server-Token': '881fad1a-eafa-4186-960f-fbb2eaff70ea',
      },
      params: {
        'clientEmail': clientEmail,
        'message': message,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
