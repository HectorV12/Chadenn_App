#import "TorchPlugin.h"
#import <torch/torch-Swift.h>

@implementation TorchPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTorchPlugin registerWithRegistrar:registrar];
}
@end
