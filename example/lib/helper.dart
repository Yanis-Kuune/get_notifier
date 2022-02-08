import 'package:get_it/get_it.dart';
import 'package:get_notifier_example/app_model.dart';

class Service {
  final appModel = GetIt.I.get<AppModel>();
  void incrementCounter() {
    appModel.counter += 1;
  }

  void decrementCounter() {
    appModel.counter -= 1;
  }
}
