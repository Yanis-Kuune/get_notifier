import 'package:flutter/material.dart';
import 'package:get_notifier/get_notifier.dart';
import 'package:get_notifier_example/app_model.dart';
import 'package:get_notifier_example/helper.dart';

// This is our global ServiceLocator
// GetIt getIt = GetIt.instance;

void main() {
  GetIt.instance
    ..registerSingleton(AppModel(), signalsReady: true)
    ..registerFactory(() => Service());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Get Notifier Example Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final am = GetIt.I.get<AppModel>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
          future: GetIt.I.allReady(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(title),
                ),
                body: Consumer2<AppModel, Service>(builder: (appModel, service, child) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        Text(
                          appModel.counter.toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              appModel.counter += 1;
                            },
                            child: const Text('Straight Increment')),
                        ElevatedButton(onPressed: service.incrementCounter, child: const Text('Service Increment')),
                        ElevatedButton(
                            onPressed: () {
                              am.counter += 1;
                            },
                            child: const Text('Other Increment'))
                      ],
                    ),
                  );
                }),
                floatingActionButton: Worker<Service>(builder: (s, child) {
                  return FloatingActionButton(
                    onPressed: () {
                      s.decrementCounter();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  );
                }),
              );
            } else {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Waiting for initialisation'),
                  SizedBox(
                    height: 16,
                  ),
                  CircularProgressIndicator(),
                ],
              );
            }
          }),
    );
  }
}
