//
//  HYAliPayManager.h
//  eros-plugin-iOS-alipay
//
//  Created by XHY on 2018/6/22.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>

@interface HYAliPayManager : NSObject

+ (void)payWithOrderInfo:(NSString *)orderInfo fromScheme:(NSString *)scheme callback:(WXModuleCallback)callback;

+ (BOOL)handlerOpenURL:(NSURL *)url;

@end
