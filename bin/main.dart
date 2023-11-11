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
import 'package:design_patterns_with_dart/structural_design_patterns/adepter_pattern/employee.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/adepter_pattern/machine_operator.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/adepter_pattern/salary_adeper.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/adepter_pattern/salary_calculator.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/decorator_pattern/email_notification_service_decorator.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/basket_item.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/facade/purchase_order.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/facade_pattern/operations/shopping_basket.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/flywaight_pattern/factory_flyweight_discount_calculator.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/flywaight_pattern/idiscount_calculator.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/proxy_pattern/proxy.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/proxy_pattern/sms_service.dart';
import 'package:design_patterns_with_dart/structural_design_patterns/proxy_pattern/sms_service_provider.dart';
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
  print('===============================');

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
  print('===============================');

  ///About Proxy Pattern
  print('===============================');
  print('"Proxy Pattern"');

  //In Proxy we prevent calling sendSms method directly from smsServiceProvider object.
  Proxy proxy = Proxy();
  print(proxy.sendSms(
      clientId: 1, mobileNumber: '0111111111', smsMessage: 'SMS 1'));
  print(proxy.sendSms(
      clientId: 1, mobileNumber: '0111111111', smsMessage: 'SMS 1'));
  print(proxy.sendSms(
      clientId: 1, mobileNumber: '0111111111', smsMessage: 'SMS 1'));
  print(proxy.sendSms(
      clientId: 1, mobileNumber: '0111111111', smsMessage: 'SMS 1'));
  print(proxy.sendSms(
      clientId: 1, mobileNumber: '0111111111', smsMessage: 'SMS 1'));
  print(proxy.sendSms(
      clientId: 1, mobileNumber: '0111111111', smsMessage: 'SMS 1'));
  print(proxy.sendSms(
      clientId: 1, mobileNumber: '0111111111', smsMessage: 'SMS 1'));
  print(proxy.sendSms(
      clientId: 2, mobileNumber: '0122222222', smsMessage: 'SMS 2'));

  ///About Decorator Pattern
  print('===============================');
  print('"Decorator Pattern"');

  SmsService smsServiceProvider = SmsServiceProvider();
  EmailNotificationServiceDetector emailNotificationServiceDetector =
      EmailNotificationServiceDetector();
  emailNotificationServiceDetector.setService(smsServiceProvider);
  print(emailNotificationServiceDetector.sendSms(
      clientId: 1, mobileNumber: '0133333333', smsMessage: 'New Email SMS'));
  print('===============================');

  ///About Adapter Pattern
  print('===============================');
  print('"Adapter Pattern"');

  //Using anti adapter pattern
  ///Object 1
  Employee antiEmployee = Employee(name: 'Mohamed', basicSalary: 2000);
  SalaryCalculator calculator = SalaryCalculator();

  ///Object 2
  MachineOperator antiOperator = MachineOperator(
      name: 'Ali', basicSalary: antiEmployee.basicSalary, shiftCode: 111);
  //After assign operator basic salary by employee basic salary this is an image from adapter pattern,
  // but i create 2 objects on the client and create casting process on the client also.
  print('Employee salary is ${calculator.calculateSalary(antiEmployee)}');
  print(
      'Machine Operator salary is ${calculator.calculateSalary(antiEmployee)}');

  //Using adepter pattern
  SalaryAdepter adepter = SalaryAdepter();
  MachineOperator operator =
      MachineOperator(name: 'Ahmed', basicSalary: 3000, shiftCode: 000);
  //After using adapter pattern you can't need to create 2 objects from employee and operator
  // because if you want to calculate employee you go to initialize employee
  // and the same thing is occurred when you want to calculate operator.
  print(
      'Employee Salary after using adapter pattern is ${adepter.calculateBasicSalary(operator)}');
  print('===============================');

  ///About Facade Pattern
  print('===============================');
  print('"Facade Pattern"');

  ShoppingBasket basket = ShoppingBasket();
  basket.addItemToBasket(
      item: BasketItem(itemId: 1, itemPrice: 50, quantity: 3));
  basket.addItemToBasket(
      item: BasketItem(itemId: 2, itemPrice: 80, quantity: 1));

  PurchaseOrder order = PurchaseOrder();
  bool orderCreated = order.createOrder(
    basket: basket,
    customerInfo: 'Name: Mohamed, Address: El-Mahala',
    bankInfo: 'Cairo Bank',
    customerNumber: '+20 122222222',
    sms: 'Order Created Successfully',
  );
  print(orderCreated);
  print('===============================');

  ///About Flyweight Pattern
  print('===============================');
  print('"Flyweight Pattern"');
  FactoryFlyweightDiscountPattern flyweightDiscount =
      FactoryFlyweightDiscountPattern();
  IDiscountCalculator discountCalculator =
      flyweightDiscount.createDiscountCalculator(currentDate: 'day');
  double discountValue =
      discountCalculator.getDiscountValue(currentDate: 'day');
  print(discountValue);
  print('===============================');
}
