import '../basket_item.dart';

class ShoppingBasket {
  final List<BasketItem> items = [];

  void addItemToBasket({required BasketItem item}) {
    final isExist = items.any((element) => element.itemId == item.itemId);
    if (!isExist) {
      items.add(item);
    }
  }

  void removeItemFromBasket({required BasketItem item}) {
    final itemIndex =
        items.indexWhere((element) => element.itemId == item.itemId);
    if (items[itemIndex].quantity > 0) {
      items[itemIndex].quantity = items[itemIndex].quantity - 1;
    }
  }

  List<BasketItem> getItems() => items;
}
