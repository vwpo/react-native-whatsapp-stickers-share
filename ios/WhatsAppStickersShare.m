#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(WhatsAppStickersShare, NSObject)

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

RCT_EXTERN_METHOD(share: (NSDictionary *) config
   resolver: (RCTPromiseResolveBlock) resolve
   rejecter: (RCTPromiseRejectBlock) reject)

@end
