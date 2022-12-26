# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'FilimoTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for FilimoTest
  pod 'IQKeyboardManagerSwift'
  pod 'Alamofire'
  pod 'CRRefresh'
  pod 'UIView-Shimmer'
  pod 'MarqueeLabel'
  pod 'ObjectMapper'
  pod 'SwiftyJSON'
  pod 'SDWebImage'

  target 'FilimoTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'FilimoTestUITests' do
    # Pods for testing
  end
  
    post_install do |installer|
   installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
     config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
     if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
       target.build_configurations.each do |config|
         config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
       end
     end
    end
   end
  end

end
