import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tensorflotter_platform_interface.dart';

/// An implementation of [TensorFlotterPlatform] that uses method channels.
class MethodChannelTensorFlotter extends TensorFlotterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tensorflotter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
