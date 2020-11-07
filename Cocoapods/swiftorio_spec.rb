module Swiftorio
  class BaseSpec < Pod::Spec
    def initialize()
      super()
      
      version = '0.0.1'
      deployment_target = '10.15'
      
      attributes_hash['module_name'] ||= name
      attributes_hash['version'] ||= version
      attributes_hash['summary'] ||= name
      attributes_hash['license'] ||= 'MIT'
      attributes_hash['authors'] ||= { 'Artyom Y. Razinov' => 'localhost' }
      attributes_hash['source'] ||= { :git => 'ssh://localhost/', :tag => "#{version}" }
      attributes_hash['homepage'] ||= "http://localhost/"
      attributes_hash['platforms'] ||= { :osx => deployment_target }
      attributes_hash['requires_arc'] ||= true
      attributes_hash['swift_version'] ||= '5.0'
      
      osx.deployment_target = deployment_target
    end
    
    def source_files_mask()
      return '*.{swift,h,m,mm,c}'
    end
    
    def framework_folder_name()
      return name.sub(/^Swiftorio/, '')
    end
  end
  
  class Spec < BaseSpec
    def initialize()
      super()
      
      framework_folder = "Frameworks/#{self.framework_folder_name}"
      
      attributes_hash['source_files'] ||= ["#{framework_folder}/Sources/**/#{source_files_mask}"]#, "#{framework_folder}/Dummy.swift"]
      attributes_hash['resources'] ||= "#{framework_folder}/Resources/**/*"
      
      test_spec 'UnitTests' do |test_spec|
        test_spec.source_files = "#{framework_folder}/UnitTests/**/#{source_files_mask}"
        
        test_spec.dependency 'SwiftorioUnitTestsFoundation'
      end  
    end
  end
  
  class FeatureSpec < Spec
    def initialize()
      super()
      
      dependency 'SwiftorioDi'
      dependency 'SwiftorioFoundation'
    end
  end
  
  class PrivateSpec < BaseSpec
    def initialize()
      super()
      
      attributes_hash['source_files'] ||= ["Sources/**/#{source_files_mask}"]#, "Dummy.swift"]
      attributes_hash['resources'] ||= "Resources/**/*"
    end
  end
end