import 'sms_service.dart';

class SmsServiceProvider implements SmsService {
  @override
  String sendSms(
      {required int clientId,
      required String mobileNumber,
      required String smsMessage}) {
    return 'The client: $clientId, Mobile Number: $mobileNumber, SMS Message: $smsMessage';
  }
}
