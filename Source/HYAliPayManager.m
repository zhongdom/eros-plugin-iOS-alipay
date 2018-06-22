//
//  HYAliPayManager.m
//  eros-plugin-iOS-alipay
//
//  Created by XHY on 2018/6/22.
//

#import "HYAliPayManager.h"
#import <AlipaySDK/AlipaySDK.h>

@interface HYAliPayManager ()

@property (nonatomic, copy) WXModuleCallback callback;

@end

@implementation HYAliPayManager

+ (instancetype)shareInstance
{
    static HYAliPayManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HYAliPayManager alloc] init];
    });
    
    return _instance;
}

- (void)_payWithOrderInfo:(NSString *)orderInfo fromScheme:(NSString *)scheme callback:(WXModuleCallback)callback
{
    self.callback = callback;
    [[AlipaySDK defaultService] payOrder:orderInfo fromScheme:scheme callback:^(NSDictionary *resultDic) {
        if (callback) {
            callback(@{
                       @"status": resultDic[@"resultStatus"],
                       @"errorMsg": resultDic[@"memo"],
                       @"data": resultDic[@"result"]
                       });
        }
    }];
}

+ (void)payWithOrderInfo:(NSString *)orderInfo fromScheme:(NSString *)scheme callback:(WXModuleCallback)callback
{
    [[HYAliPayManager shareInstance] _payWithOrderInfo:orderInfo fromScheme:scheme callback:callback];
}

+ (BOOL)handlerOpenURL:(NSURL *)url
{
    __weak typeof(HYAliPayManager) *_weakSelf = [HYAliPayManager shareInstance];
    //跳转支付宝钱包进行支付，处理支付结果
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        
        if (_weakSelf.callback)
        {
            _weakSelf.callback(@{
                                 @"status": resultDic[@"resultStatus"],
                                 @"errorMsg": resultDic[@"memo"],
                                 @"data": resultDic[@"result"]
                                 });
            _weakSelf.callback = nil;
        }
        
    }];
    
    return YES;
}

@end
