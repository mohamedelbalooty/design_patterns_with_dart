import 'ibank.dart';

class BankCairo implements IBank {
  @override
  String discount() {
    return 'This is the CAIRO BANK';
  }
}
