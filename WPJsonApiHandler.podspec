Pod::Spec.new do |s|
  s.name         = "WPJsonApiHandler"
  s.version      = "0.0.1"
  s.summary      = "An incomplete handler for wordpress/jetpack JSON API."
  s.homepage     = "https://github.com/testower/WPJsonApiHandler"
  s.license	     = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Tom Erik Støwer" => "testower@gmail.com" }
  s.source       = { :git => "https://github.com/testower/WPJsonApiHandler.git", :tag => "0.0.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Classes', 'Classes/*.{h,m}'
  s.requires_arc = true
  s.dependency 'AFNetworking', '~> 1.1.0'
end