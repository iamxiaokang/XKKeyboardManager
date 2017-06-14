#
#  Be sure to run `pod spec lint XKKeyboardManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
s.name        = "XKKeyboardManager"
s.version      = "0.0.1"
s.summary      = "自适应视图处理键盘遮挡输入控件问题"
s.description  = <<-DESC
自适应视图处理键盘遮挡输入控件问题，开发语言objective-c
DESC
s.homepage    = "https://github.com/iamxiaokang/XKKeyboardManager"
s.license      = "MIT"
s.author            = { "iamxiaokang" => "393264532@qq.com" }
s.platform    = :ios, "8.0"
s.source      = { :git => "https://github.com/iamxiaokang/XKKeyboardManager.git", :tag => "#{s.version}" }
s.source_files  = "XKKeyboardManager/*"
s.frameworks  = "Foundation","UIKit","CoreGraphics","CoreText"
end