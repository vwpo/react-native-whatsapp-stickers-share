require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-whatsapp-stickers-share"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-whatsapp-stickers-share
                   DESC
  s.homepage     = "https://github.com/vwpo/react-native-whatsapp-stickers-share"
  s.license      = "MIT"
  s.authors      = { "Roborox.org" => "vwpo@roborox.org" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/vwpo/react-native-whatsapp-stickers-share.git" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
end

