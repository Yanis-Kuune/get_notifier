import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_notifier/get_notifier.dart';

void main() {
  const MethodChannel channel = MethodChannel('get_notifier');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await GetNotifier.platformVersion, '42');
  });
}
