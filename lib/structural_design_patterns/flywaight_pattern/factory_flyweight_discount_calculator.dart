import 'day_discount_calculator.dart';
import 'idiscount_calculator.dart';
import 'item_discount_calculator.dart';

///Flyweight pattern use sharing to support large numbers of fine grained objects efficiently.

class FactoryFlyweightDiscountPattern {
  IDiscountCalculator createDiscountCalculator({required String currentDate}) {
    IDiscountCalculator? discountCalculator;

    //In this case we created local map to set objects already created so when we want to use any objects if it was created,
    // return the same.
    Map<String, IDiscountCalculator> calculatorChecker = {};
    if (calculatorChecker.containsKey(currentDate)) {
      discountCalculator = calculatorChecker[currentDate];
    } else {
      //In this case we applied factory pattern to create object from IDiscountCalculator.
      //Is usually used flyweight pattern with factory pattern.
      switch (currentDate) {
        case 'day':
          discountCalculator = DayDiscountValue();
          calculatorChecker[currentDate] = DayDiscountValue();
          break;
        case 'item':
          discountCalculator = ItemDiscountCalculator();
          calculatorChecker[currentDate] = ItemDiscountCalculator();
          break;
      }
    }
    return discountCalculator!;
  }
}
