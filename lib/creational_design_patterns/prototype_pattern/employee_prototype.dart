import 'address.dart';

abstract class EmployeePrototype {
  int? id;
  String? name;
  Address? address;

  EmployeePrototype shallowCopy();

  EmployeePrototype deepCopy();

  @override
  String toString() {
    return 'id => $id\n name => $name \n address => \n${address?.building} - ${address?.streetName} - ${address?.city}';
  }
}
