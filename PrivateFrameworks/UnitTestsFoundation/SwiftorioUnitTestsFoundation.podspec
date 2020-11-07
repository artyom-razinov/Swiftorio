require_relative '../../Cocoapods/swiftorio_spec.rb'

Swiftorio::PrivateSpec.new do |s|
  s.name = 'SwiftorioUnitTestsFoundation'
  
  s.dependency 'SwiftorioDi'
  s.dependency 'SwiftorioFoundation'
  
  s.framework = 'XCTest'
end
