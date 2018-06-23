# eros-plugin-iOS-alipay
支付宝支付插件 [eros-plugin-android-alipay](https://github.com/HirahKong/eros-plugin-android-alipay) 的iOS版本，接口和支付状态返回保持一致

## 集成
- 在iOS项目文件夹的`Podfile`中添加以下代码，然后执行 `pod update`
```
pod 'eros-plugin-iOS-alipay', :git => 'https://github.com/zhongdom/eros-plugin-iOS-alipay.git', :tag => '0.0.3'
```

- 在项目设置`TARGEI->Info->URL Types` 增加一个 `scheme`，`URL Schemes`中填写自定义的scheme值（默认值为`sendAliPayRequestDemo`，此字段要求唯一，建议自定义，否则支付回调可能不正常），`Identifier`中随便填写一个字符串

- 在 `AppDelegate.m`中添加引用

```
#import <eros-plugin-iOS-alipay/HYAliPayManager.h>
```

复制以下代码 注意代码要放到 `@end` 之前

```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([url.host isEqualToString:@"safepay"]) {
        return [HYAliPayManager handlerOpenURL:url];
    }
    return [super application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

```



## 使用方法
```
var bmAliPay = weex.requireModule('bmAliPay');
  
bmAliPay.pay({
    authInfo: '****', //服务器签名后的订单数据
    scheme: '自定义scheme，与系统设置增加的scheme保持一致，强烈建议自定义！！！！'
}, function (resData) {
    console.log("支付返回数据："+JSON.stringify(resData)); // 具体返回值参考 eros-plugin-android-alipay
}) 
```

## 更新日志

0.0.3 

* bugfix;
