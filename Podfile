# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'LoanStatistics' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LoanStatistics
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'R.swift'
  pod 'ProgressHUD'
  pod 'IQKeyboardManagerSwift'
  pod 'Charts'
  pod 'MarqueeLabel'
  pod 'SDWebImage'
  pod 'Alamofire', '5.6'
  pod 'FSCalendar'
  pod 'SnapKit', '~> 5.6.0'
  pod 'QCropper'
  pod 'FirebaseRemoteConfig'
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end