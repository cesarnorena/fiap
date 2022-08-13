#import "TensorflotterPlugin.h"
#if __has_include(<tensorflotter/tensorflotter-Swift.h>)
#import <tensorflotter/tensorflotter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tensorflotter-Swift.h"
#endif

@implementation TensorflotterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTensorFlotterPlugin registerWithRegistrar:registrar];
}
@end
