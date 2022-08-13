import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tensorflotter/tensorflotter_method_channel.dart';

void main() {
  MethodChannelTensorFlotter platform = MethodChannelTensorFlotter();
  const MethodChannel channel = MethodChannel('tensorflotter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
