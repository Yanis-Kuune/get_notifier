# get_notifier plugin
GetNotifier aims to combine the power of ChangNotifier and GetIt DI plugin to work together. It is the way to avoid context tracking over a different part of the app.

Features:
* Use Get_It plugin [get_it](https://github.com/fluttercommunity/get_it/) to inject singleton or factory dependencies anywhere in the code;
* Easely perform ChangeNotifier UI mutation using **Consumer** widget;
### Getting Started
- Add **get_it** and **get_notifier** to the __pubspec.yaml__ file.
```yaml
dependencies:
  ...
  get_notifier:
```
Then run
```sh
flutter pub get
```

- Create state file extending ChangeNotifier
__app_model.dart__
```dart
import 'package:flutter/material.dart';
import 'main.dart';

class AppModel extends ChangeNotifier {
  AppModel() {
  int _counter = 0;
  int get counter => _counter;
  set counter(int val) {
    _counter = val;
    notifyListeners();
  }
}
```
- Register it into the application together with other DI parts
__main.dart__
```dart
import 'package:flutter/material.dart';
import 'package:get_notifier/get_notifier.dart';
import 'package:get_notifier_example/app_model.dart';
import 'package:get_notifier_example/service.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;
void main() {
  getIt
    ..registerSingleton(AppModel(), signalsReady: true)
    ..registerFactory(() => Service());

  runApp(const MyApp());
}
```
- You now can separate state from mutation actions for the sake of code readability
__service.dart__
```dart
import 'package:get_notifier_example/app_model.dart';

class Service {
  final appModel = GetIt.I.get<AppModel>();

  void incrementCounter() {
    appModel.counter += 1;
  }
}
```
### Usage in UI

To make reactive part of the UI, which rebuilds due to the ```notifyListrers()``` method of ChangeNotifier ancestor simply use one of six Consumers:
1. Consumer\<A\>(builder: (a, child)=> ...)
2. Consumer2<A, B>(builder: (a,b, child)=> ...)
3. Consumer3<A, B, C>(builder: (a,b,c, child)=> ...)
4. Consumer4<A, B, C, D>(builder: (a,b,c,d, child)=> ...)
5. Consumer5<A, B, C, D, E>(builder: (a,b,c,d,e, child)=> ...)
6. Consumer6<A, B, C, D, E, F>(builder: (a,b,c,d,e,f, child)=> ...)

where A, B, C, D, E, and F are ChangeNotifier state classes

For example:
```dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_notifier/get_notifier.dart';
import 'package:get_notifier_example/app_model.dart';
import 'package:get_notifier_example/service.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final s = GetIt.I.get<Service>();
  @override
  Widget build(BuildContext context) {
    return Material(Scaffold(
                appBar: AppBar(
                  title: Text('Title'),
                ),
                body: Consumer<AppModel>(builder: (appModel, child) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        Text(
                          appModel.counter.toString(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  );
                }),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    s.incrementCounter();
                  },
                  child: const Icon(Icons.add),
                ),
              );
            
          }),
    );
}
```

That's it!

### More about

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Happy coding.