Pod::Spec.new do |s|

  s.name         = "eros-plugin-iOS-alipay"
  s.version      = "0.0.3"
  s.summary      = "适用于weex的支付宝支付插件."
  s.homepage     = "https://github.com/zhongdom"
  s.license      = "MIT"
  s.author       = { "zhongdong" => "934072239@qq.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/zhongdom/eros-plugin-iOS-alipay.git", :tag => s.version.to_s }
  s.source_files  = "Source/*.{h,m,mm}"
  s.requires_arc = true 
  s.dependency "YLAlipaySDK", "15.5.5"

end
