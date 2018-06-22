//
//  ZDAliPayModule.m
//
//  Created by zhongdong on 2018/6/13.
//  Copyright © 2018 zhongdong. All rights reserved.
//

#import "ZDAliPayModule.h"
#import <WeexPluginLoader/WeexPluginLoader/WeexPluginLoader.h>
#import "HYAliPayManager.h"
#define kAliPayScheme @"sendAliPayRequestDemo"

WX_PlUGIN_EXPORT_MODULE(bmAliPay, ZDAliPayModule)

@implementation ZDAliPayModule

WX_EXPORT_METHOD(@selector(pay:callback:))

/**
 支付宝支付

 @param params 参数 {@"authInfo": @"服务器签名后的订单数据", @"scheme": @"用户自定义的scheme"}
 @param callback 回调
 */
- (void)pay:(NSDictionary *)params callback:(WXModuleCallback)callback {
    NSString *orderString = [params objectForKey:@"authInfo"];
    
    NSString *scheme = [params objectForKey:@"scheme"];
    
    if (!scheme) {
        scheme = kAliPayScheme;
    }
    
    [HYAliPayManager payWithOrderInfo:orderString fromScheme:scheme callback:callback];
}

@end

