import 'package:design_patterns_with_dart/creational_design_patterns/builder_pattern/car_product.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/builder_pattern/director.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/builder_pattern/ibuilder.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/builder_pattern/motorcycle_product.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/builder_pattern/product.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/factory_pattern/abstract_factory/abstract_factory.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/factory_pattern/abstract_factory/ibank.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/factory_pattern/abstract_factory/icharity.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/factory_pattern/anti_pattern.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/factory_pattern/factory_method/factory_method.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/factory_pattern/factory_method/iproduct.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/prototype_pattern/address.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/prototype_pattern/employee_prototype.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/prototype_pattern/reg_employee.dart';
import 'package:design_patterns_with_dart/creational_design_patterns/singleton_pattern/singleton_pattern.dart';
import 'package:design_patterns_with_dart/test.dart'
    as design_patterns_with_dart;

void main(List<String> arguments) {
  print('Hello world: ${design_patterns_with_dart.calculate()}!');

  ///About Singleton Pattern
  print('===============================');
  Singleton x = Singleton.getInstance();
  Singleton y = Singleton.getInstance();
  print('"Singleton Pattern"');
  print('x hash code => ${x.hashCode}');
  print('y hash code => ${y.hashCode}');
  print('===============================');

  ///About Prototype Pattern
  print('===============================');
  EmployeePrototype prototype1 = RegEmployee();
  prototype1.id = 1;
  prototype1.name = 'Mohamed';
  prototype1.address = Address(
      building: 'building 1', streetName: 'streetName 1', city: 'city 1');
  EmployeePrototype shallowCopy1 = prototype1.shallowCopy();
  EmployeePrototype deepCopy1 = prototype1.deepCopy();

  print('"Prototype Pattern"');
  print('prototype1 hash code => ${prototype1.hashCode}');
  print('prototype1 shallow copy hash code => ${shallowCopy1.hashCode}');
  print('prototype1 deep copy hash code => ${deepCopy1.hashCode}');

  print('"Prototype Original Values"');
  print('prototype1: \n ${prototype1.toString()}');
  print('prototype1 shallow copy: \n ${shallowCopy1.toString()}');
  print('prototype1 deep copy: \n ${deepCopy1.toString()}');

  shallowCopy1.id = 2;
  shallowCopy1.name = 'Ahmed';
  shallowCopy1.address?.building = 'new building';
  shallowCopy1.address?.streetName = 'new streetName';
  shallowCopy1.address?.city = 'new city';

  print('"Prototype New Values"');
  print('prototype1: \n ${prototype1.toString()}');
  print('prototype1 shallow copy: \n ${shallowCopy1.toString()}');
  print('prototype1 deep copy: \n ${deepCopy1.toString()}');
  print('===============================');

  ///About Builder Pattern
  print('===============================');
  print('"Builder Pattern"');
  Director director = Director();
  IBuilder car = CarProduct(brand: 'JEEP');
  IBuilder motorcycle = MotorcycleProduct(brand: 'HONDA');

  director.construct(iBuilder: car);
  Product carProduct = car.getProduct();
  print('Car => ${carProduct.showPart()}');

  director.construct(iBuilder: motorcycle);
  Product motorcycleProduct = motorcycle.getProduct();
  print('Motorcycle => ${motorcycleProduct.showPart()}');

  ///About Factory Method and Abstract Factory Patterns
  print('===============================');
  print('"Factory Method and Abstract Factory Patterns"');

  //The main difference between a “factory method” and an “abstract factory” is that the factory method is a single method,
  // and an abstract factory is an object.
  //The factory method is just a method, it can be overridden in a subclass,
  // whereas the abstract factory is an object that has multiple factory methods on it.

  print('\n');
  print('Anti Factory Pattern');
  AntiPattern antiPattern = AntiPattern();
  antiPattern.checkProduct();

  print('\n');
  print('Factory Method Pattern');
  FactoryMethod factoryMethod = FactoryMethod();
  IProduct? product = factoryMethod.createProduct(condition: '123');
  print(product?.doSomething());

  print('\n');
  print('Abstract Factory Pattern');
  AbstractFactory abstractFactory = AbstractFactory();
  IBank? bank = abstractFactory.createBank(cardNumber: 'cip123');
  print(bank?.discount());

  ICharity? charity = abstractFactory.createCharity(inviteCode: '111');
  print(charity?.fundraising());
}
