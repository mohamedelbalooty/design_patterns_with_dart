import 'package:design_patterns_with_dart/creational_design_patterns/factory_pattern/abstract_factory/ibank.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/factory_pattern/abstract_factory/icharity.dart';

abstract class IAbstractFactory {
  IBank? createBank({required cardNumber});

  ICharity? createCharity({required inviteCode});
}
