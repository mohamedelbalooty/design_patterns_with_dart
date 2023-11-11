import 'idiscount_calculator.dart';

class ItemDiscountCalculator implements IDiscountCalculator {
  @override
  double getDiscountValue({required String currentDate}) {
    return 1.5;
  }
}
