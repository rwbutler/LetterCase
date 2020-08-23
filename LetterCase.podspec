Pod::Spec.new do |s|
  s.name             = 'LetterCase'
  s.version          = '1.5.1'
  s.swift_version    = '5.0'
  s.summary          = 'String letter case conversion and JSON decoding / encoding strategies'
  s.description      = <<-DESC
Lightweight library written in Swift for converting the letter case of a String. Includes implementations of JSONDecoder.KeyDecodingStrategy and JSONEncoder.KeyEncodingStrategy for JSON decoding / encoding.
                       DESC
  s.homepage         = 'https://github.com/rwbutler/LetterCase'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ross Butler' => 'github@rwbutler.com' }
  s.source           = { :git => 'https://github.com/rwbutler/LetterCase.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ross_w_butler'
  s.ios.deployment_target = '8.0'
  s.source_files = 'LetterCase/Classes/**/*'
end
