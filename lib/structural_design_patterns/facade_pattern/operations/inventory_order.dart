import 'shopping_basket.dart';

class InventoryOrder {
  String createInventoryOrder({required ShoppingBasket basket}) {
    basket.getItems();
    return 'Order number is ${basket.getItems().length}';
  }
}
