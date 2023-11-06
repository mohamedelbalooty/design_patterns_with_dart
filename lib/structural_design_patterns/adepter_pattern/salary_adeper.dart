import 'employee.dart';
import 'machine_operator.dart';
import 'salary_calculator.dart';

class SalaryAdepter extends SalaryCalculator {
  late Employee _employee;

  double calculateBasicSalary(MachineOperator operator) {
    _employee =
        Employee(name: operator.name, basicSalary: operator.basicSalary);
    _employee.basicSalary = operator.basicSalary;
    return super.calculateSalary(_employee);
  }
}
