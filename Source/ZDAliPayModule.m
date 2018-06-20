//
//  ZDAliPayModule.m
//
//  Created by zhongdong on 2018/6/13.
//  Copyright © 2018 zhongdong. All rights reserved.
//

#import "ZDAliPayModule.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
#import <AlipaySDK/AlipaySDK.h>

WX_PlUGIN_EXPORT_MODULE(bmAliPay, ZDAliPayModule)

@implementation ZDAliPayModule

WX_EXPORT_METHOD(@selector(pay:callback:))

/**
 支付宝支付

 @param params 参数 {@"authInfo": @"服务器签名后的订单数据"}
 @param callback 回调
 */
- (void)pay:(NSDictionary *)params callback:(WXModuleCallback)callback {
    NSString *orderString =[params objectForKey:@"authInfo"];
    
    [[AlipaySDK defaultService] payOrder:orderString fromScheme:kAliPayScheme callback:^(NSDictionary *resultDic) {
        if (callback) {
            callback(resultDic);
        }
    }];
}

@end

