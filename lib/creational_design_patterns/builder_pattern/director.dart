import 'ibuilder.dart';

/// Director is responsible for execute builder operations and construct builder object
class Director {
  late IBuilder iBuilder;

  void construct({required IBuilder iBuilder}) {
    this.iBuilder = iBuilder;
    this.iBuilder.startUpOperations();
    this.iBuilder.buildBody();
    this.iBuilder.insertWheels();
    this.iBuilder.addToHeadLine();
    this.iBuilder.endOperations();
  }
}
