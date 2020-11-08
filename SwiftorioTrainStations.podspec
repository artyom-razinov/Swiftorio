require_relative 'Cocoapods/swiftorio_spec.rb'

Swiftorio::FeatureSpec.new do |s|
  s.name = 'SwiftorioTrainStations'
  
  s.dependency 'SwiftorioLocalization'
  s.dependency 'SwiftorioDataRaw'
  s.dependency 'SwiftorioBlueprints'
end
