import 'shopping_basket.dart';

class PurchaseInvoice {
  double discount = 0;
  double totalAmount = 0;
  double netTotal = 0;

  PurchaseInvoice createInvoice(
      {required ShoppingBasket basket, required String customerInfo}) {
    PurchaseInvoice invoice = PurchaseInvoice();
    final items = basket.getItems();
    for (var element in items) {
      invoice.totalAmount += element.itemPrice * element.quantity;
    }
    if (items.length > 5) invoice.discount = 20;
    invoice.netTotal = invoice.totalAmount - invoice.discount;
    return invoice;
  }
}
