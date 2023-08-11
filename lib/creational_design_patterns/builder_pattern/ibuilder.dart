import 'product.dart';

abstract class IBuilder {
  void startUpOperations();

  void buildBody();

  void insertWheels();

  void addToHeadLine();

  void endOperations();

  Product getProduct();
}
