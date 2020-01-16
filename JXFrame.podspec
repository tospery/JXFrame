#
# Be sure to run `pod lib lint JXFrame.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JXFrame'
  s.version          = '1.0.1'
  s.summary          = 'iOS App Framework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
						iOS App Framework using ObjC.
                       DESC

  s.homepage         = 'https://github.com/tospery/JXFrame'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tospery' => 'tospery@gmail.com' }
  s.source           = { :git => 'https://github.com/tospery/JXFrame.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'JXFrame/Classes/**/*'
  
  s.resource_bundles = {
    'JXFrame' => ['JXFrame/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit', 'Accelerate', 'QuartzCore', 'CoreLocation', 'SystemConfiguration', 'AdSupport', 'WebKit', 'CoreGraphics', 'Photos'
  s.dependency 'OvercoatObjC', '1.0.1'
  s.dependency 'CocoaLumberjack', '3.6.0'
  s.dependency 'SDWebImage', '5.4.0'
  s.dependency 'MJRefresh', '3.3.1'
  s.dependency 'FCUUID', '1.3.1'
  s.dependency 'WebViewJavascriptBridge', '6.0.3'
  s.dependency 'PINCache', '3.0.1-beta.8'
  s.dependency 'GVUserDefaults', '1.0.2'
  s.dependency 'DZNEmptyDataSet', '1.8.1'
  s.dependency 'JLRoutes', '2.1'
  s.dependency 'QMUIKit/QMUICore', '4.0.4'
  s.dependency 'TYAlertController', '1.2.0'
  s.dependency 'MBProgressHUD', '1.1.0'
  # s.dependency 'LTNavigationBar', '2.1.9'
end
