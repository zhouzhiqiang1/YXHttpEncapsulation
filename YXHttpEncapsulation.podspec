Pod::Spec.new do |s|

  s.name         = "YDHttpClient"

  s.version      = "0.1.1"

  s.homepage      = 'https://guides.cocoapods.org/making/private-cocoapods.html'

  s.ios.deployment_target = '7.0'

  s.summary      = "Http Client"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Aren" => "renchonghui@readyidu.com" }

  s.source       = { :git => "http://192.168.4.181/dev-team/YXHttpClient.git", :tag => s.version }

  s.source_files  = "YXHttpClient/*.{h,m}"

  s.requires_arc = true
  s.dependency 'AFNetworking','~>3.1.0'

end
