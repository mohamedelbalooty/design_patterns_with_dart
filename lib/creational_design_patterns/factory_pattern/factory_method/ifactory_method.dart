import 'iproduct.dart';

abstract class IFactoryMethod{
  IProduct? createProduct({required String condition});
}