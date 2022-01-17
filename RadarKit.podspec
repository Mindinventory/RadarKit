
Pod::Spec.new do |spec|

spec.name         = "RadarKit"
spec.version      = "1.0.0"
spec.summary      = "RadarKit allows you to add radar effect to find nearby user"
spec.description  = <<-DESC
RadarKit allows you to add radar effect to find nearby user
DESC

spec.homepage     = "https://github.com/parthgohel2810/RadarKit.git"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "Parth Gohel" => "parth.gohel@mindinventory.com" }
spec.platform     = :ios
spec.platform     = :ios, "12.0"
spec.swift_version = '5.0'
spec.ios.deployment_target = '12.0'

spec.source       = { :git => "https://github.com/parthgohel2810/RadarKit.git", :tag => "#{spec.version}" }

spec.resources  = "RadarKit/**/*.{lproj,xcdatamodeld,xcassets,strings,xib,json,pdf,png,ttf}"
spec.resource_bundle = {'RadarKit' => [
'RadarKit/**/*.{lproj,xcdatamodeld,xcassets,strings,xib,json,pdf,png}'
]
}

spec.default_subspec = "Core"
spec.subspec "Core" do |ss|
ss.source_files  = "RadarKit/**/*.swift"
end
end
