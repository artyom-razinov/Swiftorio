require_relative 'Cocoapods/swiftorio_spec.rb'

Swiftorio::FeatureSpec.new do |s|
  s.name = 'SwiftorioZlib'
  
  s.library = 'z'
end