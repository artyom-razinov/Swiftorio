install! 'cocoapods',
  :generate_multiple_pod_projects => true,
  :incremental_installation => true
  
require_relative 'Cocoapods/swiftorio_pod.rb'

project_name = 'swiftorio.xcodeproj'

project project_name
workspace 'swiftorio.xcworkspace'

platform :osx, :deployment_target => '10.15'

use_frameworks!

def swiftorio_pod_names()
  return [
    'SwiftorioBlueprints',
    'SwiftorioDataRaw',
    'SwiftorioDi',
    'SwiftorioFoundation',
    'SwiftorioRichText'
  ]
end

def all_framework_names()
  return swiftorio_pod_names + [
    'lua4swift'
  ]
end

def swiftorio_dependencies()
  pod 'lua4swift', :git => 'https://github.com/weyhan/lua4swift', :inhibit_warnings => true
  
  swiftorio_pod_names.each do |pod_name|
    swiftorio_pod pod_name
  end
end

target 'swiftorio' do
  swiftorio_dependencies
end

target 'UnitTests' do
  swiftorio_dependencies
  
  swiftorio_private_pod 'SwiftorioUnitTestsFoundation'
end

post_install do |installer|
    files = Dir.glob("*.xcodeproj")
    proj_file = files[0]
    app_project = Xcodeproj::Project.open("/Users/razinov/src/swiftorio/swiftorio.xcodeproj")
    
    app_project.native_targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = '$(inherited) @executable_path/../Frameworks @loader_path/Frameworks'
            prefix = ' @executable_path/'
            
            # For each pod, add the framework path to LD_RUNPATH_SEARCH_PATHS
            all_framework_names.each do |framework_name|
              config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = config.build_settings['LD_RUNPATH_SEARCH_PATHS'] + prefix + framework_name + '/'
            end
            
            installer.generated_projects.each do |pod_target|
              puts(pod_target)

                # pod_target.build_configurations.each do |pod_config|
                #     pod_config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
                #     pod_config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = '$(inherited) /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx/'
                # end
            end
        end
    end

    app_project.save
end