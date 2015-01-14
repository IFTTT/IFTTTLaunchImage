Pod::Spec.new do |s|
  s.name             = "IFTTTLaunchImage"
  s.version          = "0.3.1"
  s.summary          = "Put your asset catalog launch images to work for you."
  s.homepage         = "https://github.com/IFTTT/IFTTTLaunchImage"
  s.license          = 'MIT'
  s.author           = { "Jonathan Hersh" => "jon@her.sh" }
  s.source           = { :git => "https://github.com/IFTTT/IFTTTLaunchImage.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jhersh'
  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.compiler_flags   = '-fmodules'
  s.source_files     = 'IFTTTLaunchImage/*.{h,m}'
  s.frameworks       = 'UIKit'
end
