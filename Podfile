# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'StockMaster' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for StockMaster
    pod ‘Firebase/Database’
    pod ‘Firebase/Auth’
    pod ‘Firebase/Storage’
    pod ‘Cosmos‘

# Workaround for Cocoapods issue #7606
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

  target 'StockMasterTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'StockMasterUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
