import 'iproduct.dart';

class ProductA implements IProduct {
  @override
  String doSomething() {
    return 'This is Product from type (A)';
  }
}