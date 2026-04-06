# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Sluff Scorecard' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Sluff Scorecard

  # Google Mobile Ads SDK
  pod 'Google-Mobile-Ads-SDK'

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      
      # Fix sandbox rsync errors
      config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'
      
      # Prevent code signing issues on Pods
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      config.build_settings['CODE_SIGNING_REQUIRED'] = 'NO'
      
      # Clean up signing warnings
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ''
      config.build_settings['CODE_SIGNING_IDENTITY'] = ''
      
    end
  end
end