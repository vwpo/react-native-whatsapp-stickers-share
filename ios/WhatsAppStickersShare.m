#import "WhatsAppStickersShare.h"

@implementation WhatsAppStickersShare

RCT_EXPORT_MODULE()

RCT_EXTERN_METHOD(
    share: (NSDictionary *) config
    resolver: (RCTPromiseResolveBlock) resolve
    rejecter: (RCTPromiseRejectBlock) reject
)

@end
