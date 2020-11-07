def swiftorio_pod(name)
  pod name, :path => '.', :testspecs => ['UnitTests']
end

def swiftorio_private_pod(name)
  framework_folder_name = name.sub(/^Swiftorio/, '')
  framework_folder = "PrivateFrameworks/#{framework_folder_name}"
      
  pod name, :path => "#{framework_folder}"
end