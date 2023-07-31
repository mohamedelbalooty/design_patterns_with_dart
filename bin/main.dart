import 'package:design_patterns_with_dart/creational_design_patterns/singleton_design_pattern.dart';
import 'package:design_patterns_with_dart/test.dart' as design_patterns_with_dart;

void main(List<String> arguments) {
  print('Hello world: ${design_patterns_with_dart.calculate()}!');
  Singleton x = Singleton();
  Singleton y = Singleton();
}
