// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'tensorflotter_platform_interface.dart';

class TensorFlotter {
  final String modelPath;
  final String labelsPath;

  const TensorFlotter({
    required this.modelPath,
    required this.labelsPath,
  });

  Future<String?> getPlatformVersion() {
    return TensorFlotterPlatform.instance.getPlatformVersion();
  }
}
