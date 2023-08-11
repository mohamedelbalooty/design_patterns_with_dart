import 'ibuilder.dart';
import 'product.dart';

class CarProduct implements IBuilder {
  final String brand;

  CarProduct({required this.brand});

  Product product = Product();

  @override
  void startUpOperations() {
    product.addPart(part: 'Car mode is: $brand');
  }

  @override
  void buildBody() {
    product.addPart(part: 'Car body was added');
  }

  @override
  void insertWheels() {
    product.addPart(part: 'Car wheels was inserted');
  }

  @override
  void addToHeadLine() {
    product.addPart(part: 'Add car to headline');
  }

  @override
  void endOperations() {
    product.addPart(part: 'End of car operations');
  }

  @override
  Product getProduct() {
    return product;
  }
}
