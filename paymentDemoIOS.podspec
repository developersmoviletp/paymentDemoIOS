#
# Be sure to run `pod lib lint paymentDemoIOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'paymentDemoIOS'
  s.version          = '1.0.17'
  s.summary          = 'Demo payment'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
libreria demo para el modulo de payment
                       DESC

  s.homepage         = 'https://github.com/developersmoviletp/paymentDemoIOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'developersmoviletp' => 'jrescobarmiron@gmail.com' }
  s.source           = { :git => 'https://github.com/developersmoviletp/paymentDemoIOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'PaymentResources/Classes/**/*.{h,a,m,Swift}'
  s.dependency 'moa'
  s.dependency 'PKHUD'
  s.dependency 'AlamofireObjectMapper'
  s.dependency 'Alamofire'
  s.dependency 'ActionSheetPicker-3.0'
  s.dependency 'RealmSwift'
end
