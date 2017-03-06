Pod::Spec.new do |s|

  s.name         = "YXHttpEncapsulation"

  s.version      = "0.0.1"
  
  s.summary      = "A short description of Storyboard."

  s.homepage     = "https://guides.cocoapods.org/making/private-cocoapods.html"

  s.ios.deployment_target = '8.0'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "zhouzhiqiang1" => "zhou83955@sina.com" }

  s.source       = { :git => "https://github.com/zhouzhiqiang1/YXHttpEncapsulation.git", :tag => "0.0.1" }

  s.source_files  = "YXHttpClient/*.{h,m}"
  
  s.requires_arc = true
end
