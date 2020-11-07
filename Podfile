install! 'cocoapods',
  :generate_multiple_pod_projects => true,
  :incremental_installation => true
  
require_relative 'Cocoapods/swiftorio_pod.rb'

project 'swiftorio.xcodeproj'
workspace 'swiftorio.xcworkspace'

platform :osx, :deployment_target => '10.15'

use_frameworks!

target 'swiftorio' do
  pod 'lua4swift', :git => 'https://github.com/weyhan/lua4swift', :inhibit_warnings => true
  
  swiftorio_pod 'SwiftorioBlueprints'
  swiftorio_pod 'SwiftorioDataRaw'
  swiftorio_pod 'SwiftorioDi'
  swiftorio_pod 'SwiftorioFoundation'
  
  swiftorio_private_pod 'SwiftorioUnitTestsFoundation'
end
