import 'idiscount_calculator.dart';

class DayDiscountValue implements IDiscountCalculator {
  @override
  double getDiscountValue({required String currentDate}) {
    return 1.3;
  }
}
