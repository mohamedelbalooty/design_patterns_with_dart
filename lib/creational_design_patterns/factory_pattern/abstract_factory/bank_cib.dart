import 'ibank.dart';

class BankCip implements IBank {
  @override
  String discount() {
    return 'This is the CIP BANK';
  }
}
