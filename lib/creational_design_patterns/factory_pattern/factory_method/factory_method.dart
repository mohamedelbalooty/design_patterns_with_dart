import 'ifactory_method.dart';
import 'iproduct.dart';
import 'product_a.dart';
import 'product_b.dart';

class FactoryMethod implements IFactoryMethod {
  @override
  IProduct? createProduct({required String condition}) {
    //This is the logic is done to create the product object and not create it on clint or presentation.
    switch (condition) {
      case '123':
        return ProductA();
      case '111':
        return ProductB();
      default:
        return null;
    }
  }
}
