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
    'SwiftorioRichText',
    'SwiftorioGameBundle',
    'SwiftorioLocalization',
    'SwiftorioTrainStations',
    'SwiftorioZlib'
  ]
end

def all_framework_names()
  return swiftorio_pod_names + [
    'lua4swift',
    'INIParser',
    'PathKit'
  ]
end

def swiftorio_dependencies()
  pod 'lua4swift', :git => 'https://github.com/weyhan/lua4swift', :inhibit_warnings => true
  pod 'INIParser', :path => '/Users/razinov/src/Perfect-INIParser'
  pod 'PathKit'
  
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
  project = Xcodeproj::Project.open("/Users/razinov/src/swiftorio/swiftorio.xcodeproj")
  
  patch_to_be_able_to_run_executable(project)
  patch_removing_default_imports()

  project.save
end

def patch_to_be_able_to_run_executable(project)
  project.native_targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = '$(inherited) @executable_path/../Frameworks @loader_path/Frameworks'
          prefix = ' @executable_path/'
          
          # For each pod, add the framework path to LD_RUNPATH_SEARCH_PATHS
          all_framework_names.each do |framework_name|
            config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = config.build_settings['LD_RUNPATH_SEARCH_PATHS'] + prefix + framework_name + '/'
          end
      end
  end
end

def patch_removing_default_imports()
  swiftorio_pod_names.each do |target_name|
    remove_default_import_from_target(target_name)
  end
end

def remove_default_import_from_target(target_name)
  dir = "#{__dir__}/Pods/Target Support Files/#{target_name}"
  
  remove_default_import_from_file("#{dir}/#{target_name}-umbrella.h")
  remove_default_import_from_file("#{dir}/#{target_name}-prefix.pch")
end

def remove_default_import_from_file(file_path)
  if File.file?(file_path)
    text = File.read(file_path)
    
    new_defines = '#ifndef MIXBOX_EXPORT
#if defined(__cplusplus)
#define MIXBOX_EXPORT extern "C"
#else
#define MIXBOX_EXPORT extern
#endif
#endif'

    # iOS
    text = text.gsub(old_defines('UIKit'), new_defines)
    # OSX
    text = text.gsub(old_defines('Cocoa'), new_defines)
    text = text.gsub('FOUNDATION_EXPORT', 'MIXBOX_EXPORT')

    File.open(file_path, "w") { |file| file.puts text }
  end
end

def old_defines(framework)
  "#ifdef __OBJC__
#import <#{framework}/#{framework}.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern \"C\"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif"
end