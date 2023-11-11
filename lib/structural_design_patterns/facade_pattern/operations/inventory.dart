import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/basket_item.dart';

class Inventory{
  bool checkItemQuantity({required BasketItem item}) => item.quantity < 100;
}