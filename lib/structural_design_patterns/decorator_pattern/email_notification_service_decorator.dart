import 'sms_service_idecorator.dart';

class EmailNotificationServiceDetector extends SmsServiceIDecorator {
  String smsSendNotification(
      {required int clientId, required String notification}) {
    return '$notification is sent to $clientId at ${DateTime.now()}';
  }

  @override
  String sendSms({
    required int clientId,
    required String mobileNumber,
    required String smsMessage,
  }) {
    final String sms = super.sendSms(
        clientId: clientId, mobileNumber: mobileNumber, smsMessage: smsMessage);
    final String result = '$sms ${smsSendNotification(clientId: clientId, notification: smsMessage)}';
    return result;
  }
}
