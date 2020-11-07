require_relative 'Cocoapods/swiftorio_spec.rb'

Swiftorio::FeatureSpec.new do |s|
  s.name = 'SwiftorioDataRaw'
  
  s.dependency 'lua4swift'
end
