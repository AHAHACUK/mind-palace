import 'package:client/dependency/entities/dependency_bloc_factory.dart';
import 'package:client/dependency/entities/dependency_interactor.dart';

class Dependency {
  final DependencyInteractor interactor;
  final DependencyBlocFactory blocFactory;

  static late Dependency _instance;

  Dependency({required this.interactor, required this.blocFactory});

  static Dependency get instance => _instance;

  void setup() {
    _instance = this;
  }
}
