platform :ios, '13.6'
use_frameworks!

def install_pods
  pod 'SwiftLint', '~> 0.36'
end

target 'moments' do
  install_pods
end

target 'momentsTests' do
  inherit! :search_paths
  install_pods
end
