import 'package:flutter_test/flutter_test.dart';
import 'package:tensorflotter/tensorflotter.dart';
import 'package:tensorflotter/tensorflotter_platform_interface.dart';
import 'package:tensorflotter/tensorflotter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTensorflotterPlatform 
    with MockPlatformInterfaceMixin
    implements TensorFlotterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TensorFlotterPlatform initialPlatform = TensorFlotterPlatform.instance;

  test('$MethodChannelTensorFlotter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTensorFlotter>());
  });

  test('getPlatformVersion', () async {
    TensorFlotter tensorflotterPlugin = TensorFlotter();
    MockTensorflotterPlatform fakePlatform = MockTensorflotterPlatform();
    TensorFlotterPlatform.instance = fakePlatform;
  
    expect(await tensorflotterPlugin.getPlatformVersion(), '42');
  });
}
