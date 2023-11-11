import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/operations/inventory.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/operations/inventory_order.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/operations/payment_processor.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/operations/purchase_invoice.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/operations/shopping_basket.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/operations/sms_notifications.dart';

///Facade pattern layer
///In this layer we provide a unified interface to a set of interfaces (operations) in a subsystem.

class PurchaseOrder {
  bool createOrder({
    required ShoppingBasket basket,
    required String customerInfo,
    required String bankInfo,
    required String customerNumber,
    required String sms,
  }) {
    bool isAvailable = true;

    //Check if item in inventory or not.
    Inventory inventory = Inventory();
    basket.getItems().forEach((item) {
      if (!inventory.checkItemQuantity(item: item)) isAvailable = false;
    });

    if (isAvailable) {
      //Create inventory order about basket items.
      InventoryOrder inventoryOrder = InventoryOrder();
      inventoryOrder.createInventoryOrder(basket: basket);

      //Create purchase invoice.
      PurchaseInvoice purchaseInvoice = PurchaseInvoice();
      purchaseInvoice.createInvoice(basket: basket, customerInfo: customerInfo);

      //Payment process.
      PaymentProcessor paymentProcessor = PaymentProcessor();
      paymentProcessor.handelPayment(
          amount: purchaseInvoice.netTotal, bankInfo: bankInfo);

      //Send sms notification.
      SmsNotifications smsNotifications = SmsNotifications();
      smsNotifications.sendSmsNotification(to: customerNumber, sms: sms);
      return true;
    } else {
      return false;
    }
  }
}
