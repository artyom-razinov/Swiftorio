require_relative 'Cocoapods/swiftorio_spec.rb'

Swiftorio::FeatureSpec.new do |s|
  s.name = 'SwiftorioLocalization'
  
  s.dependency 'SwiftorioGameBundle'
  s.dependency 'INIParser'
end
