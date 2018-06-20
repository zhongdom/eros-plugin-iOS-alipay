# eros-plugin-iOS-alipay
支付宝支付插件 [eros-plugin-android-alipay](https://github.com/HirahKong/eros-plugin-android-alipay) 的iOS版本，接口和支付状态返回保持一致

## 集成
- 在iOS项目文件夹的`Podfile`中添加以下地址，然后执行 `pod update`
```
pod 'eros-plugin-iOS-alipay', :git => 'https://github.com/zhongdom/eros-plugin-iOS-alipay.git', :tag => '0.0.1'
```

- 在项目设置`TARGEI->Info->URL Types` 增加一个 `scheme`，`URL Schemes`中填写`sendAliPayRequest`，`Identifier`中随便填写一个字符串

- 在 `AppDelegate.m`中添加以下方法

```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    // eros init 生成的项目为保证其他功能正常，需调用父类方法
    [super application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    return YES;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options {
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    return YES;
}
```



## 使用方法
```
var bmAliPay = weex.requireModule('bmAliPay');
  
bmAliPay.pay({
    authInfo: '****'//服务器签名后的订单数据
}, function (resData) {
    console.log("支付返回数据："+JSON.stringify(resData)); // 具体返回值参考 eros-plugin-android-alipay
}) 
```