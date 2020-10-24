platform :ios, '12.0'
use_frameworks!

def install_pods
  pod 'Kingfisher', '~> 5.9'
  pod 'SwiftLint', '~> 0.36'
  pod 'Alamofire', '~> 5.2'
end

target 'moments' do
  install_pods
end

target 'momentsTests' do
  inherit! :search_paths
  install_pods
end
