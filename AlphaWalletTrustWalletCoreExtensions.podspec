#
# Be sure to run `pod lib lint AlphaWalletTrustWalletCoreExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AlphaWalletTrustWalletCoreExtensions'
  s.version          = '1.0.0'
  s.summary          = 'AlphaWallet extensions library around TrustWalletCore'
  s.description      = <<-DESC
  Lightweight library representing the AlphaWallet extensions library around TrustWalletCore
                       DESC
  s.homepage         = "https://github.com/AlphaWallet/alpha-wallet-ios/tree/master/modules/AlphaWalletTrustWalletCoreExtensions"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Hwee-Boon Yar" => "hboon@motionobj.com" }
  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'
  s.platform         = :ios, "13.0"
  s.source           = { :git => 'git@github.com:AlphaWallet/alpha-wallet-ios.git', :tag => "#{s.version}" }
  s.source_files     = 'modules/AlphaWalletTrustWalletCoreExtensions/AlphaWalletTrustWalletCoreExtensions/**/*.{h,m,swift}'
  s.pod_target_xcconfig = { 'SWIFT_OPTIMIZATION_LEVEL' => '-Owholemodule' }

  s.frameworks       = 'Foundation'

  s.dependency 'BigInt'
  s.dependency 'TrustWalletCore', '2.6.34'
end


