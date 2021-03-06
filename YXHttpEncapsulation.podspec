Pod::Spec.new do |s|

  s.name         = "YXHttpEncapsulation"

  s.version      = "0.0.1"

  s.summary      = "all kinds of categories for iOS develop"

  s.homepage     = "https://guides.cocoapods.org/making/private-cocoapods.html"
  
  s.ios.deployment_target = '7.0'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "zhouzhiqiang1" => "zhou83955@sina.com" }

  s.source       = { :git => "https://github.com/zhouzhiqiang1/YXHttpEncapsulation.git", :tag => s.version }

  s.source_files  = "YXHttpEncapsulation/*.{h,m}"
  
  s.requires_arc = true
  
  s.dependency "AFNetworking","~>3.1.0"
end
