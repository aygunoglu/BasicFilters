Pod::Spec.new do |spec|

  spec.name         = "BasicFilters"
  spec.version      = "1.0.0"
  spec.summary      = "Basic UIImage filters."
  spec.description  = "This framework provides basic and easy-to-use UIImage filters."

  spec.homepage     = "https://github.com/aygunoglu/BasicFilters"
  spec.license      = "MIT"
  spec.author             = { "aygunoglu" => "hasanaygunoglu@gmail.com" }
  spec.platform     = :ios, "14.5"
  spec.source       = { :git => "https://github.com/aygunoglu/BasicFilters.git", :tag => spec.version.to_s }
  spec.source_files  = "BasicFilters/**/*.{swift}"
  spec.frameworks = "UIKit", "CoreImage"
  spec.swift_versions = "5.4.2"
end
