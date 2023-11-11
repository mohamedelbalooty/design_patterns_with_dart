import 'package:design_patterns_with_dart/structural_design_patterns/proxy_pattern/sms_service.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/proxy_pattern/sms_service_provider.dart';

///The Proxy is a placeholder for anther object to control access to it.
///We want to create service about send sms message but if client call this service more than 5 times don't send sms.

class Proxy {
  SmsService? _smsService;

  final Map<String, dynamic> clientSmsCount = {};

  String sendSms({
    required int clientId,
    required String mobileNumber,
    required String smsMessage,
  }) {
    //Lazy initialization
    _smsService ??= SmsServiceProvider();

    //First call to sms
    // print(clientSmsCount['$clientId'] > 5);
    if (!clientSmsCount.containsKey('$clientId')) {
      clientSmsCount['$clientId'] = 1;
      return _smsService!.sendSms(
          clientId: clientId,
          mobileNumber: mobileNumber,
          smsMessage: smsMessage);
    }
    //Second call to sms
    else {
      if (clientSmsCount['$clientId'] >= 5) {
        return 'Don\'t send sms because your quota is over';
      } else {
        clientSmsCount['$clientId'] = clientSmsCount['$clientId'] + 1;
        return _smsService!.sendSms(
            clientId: clientId,
            mobileNumber: mobileNumber,
            smsMessage: smsMessage);
      }
    }
  }
}
