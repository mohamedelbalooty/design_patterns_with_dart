import 'bank_cairo.dart';
import 'bank_cib.dart';
import 'charity_a.dart';
import 'charity_b.dart';
import 'iabstract_factory.dart';
import 'ibank.dart';
import 'icharity.dart';

class AbstractFactory implements IAbstractFactory {
  @override
  IBank? createBank({required cardNumber}) {
    switch (cardNumber) {
      case 'cip123':
        return BankCip();
      case 'cairo111':
        return BankCairo();
      default:
        return null;
    }
  }

  @override
  ICharity? createCharity({required inviteCode}) {
    switch (inviteCode) {
      case '123':
        return CharityA();
      case '111':
        return CharityB();
      default:
        return null;
    }
  }
}
