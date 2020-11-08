require_relative 'Cocoapods/swiftorio_spec.rb'

Swiftorio::FeatureSpec.new do |s|
  s.name = 'SwiftorioBlueprints'
  
  s.dependency 'SwiftorioDataRaw'
  s.dependency 'GzipSwift'
end
