import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:get_notifier_example/app_model.dart';
import 'package:get_notifier_example/helper.dart';

void main() {
  GetIt.instance
    ..registerSingleton(AppModel(), signalsReady: true)
    ..registerFactory(() => Service());
  group('Increment', () {
    test('do encrease', () {
      int counter = GetIt.I.get<AppModel>().counter;
      Service().incrementCounter();
      int newcounter = GetIt.I.get<AppModel>().counter;
      expect(counter, newcounter - 1);
    });
  });
}
