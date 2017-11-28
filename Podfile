platform :ios, :deployment_target => '9.0'
workspace 'PiwikPRO'
use_frameworks!

target "PiwikPROApp" do
  pod 'PiwikPROSDK', '~> 1.0'
  target 'PiwikPROAppTests' do
    inherit! :search_paths
  end
  project 'PiwikPROApp/PiwikPROApp.xcodeproj'
end
