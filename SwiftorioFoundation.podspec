require_relative 'Cocoapods/swiftorio_spec.rb'

Swiftorio::Spec.new do |s|
  s.name = 'SwiftorioFoundation'
  
  s.dependency 'SwiftorioDi'
end
