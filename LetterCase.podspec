Pod::Spec.new do |s|
  s.name             = 'LetterCase'
  s.version          = '1.4.0'
  s.swift_version    = '5.0'
  s.summary          = 'String letter case conversion'
  s.description      = <<-DESC
Lightweight library written in Swift for converting the letter case of a String.
                       DESC
  s.homepage         = 'https://github.com/rwbutler/LetterCase'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ross Butler' => 'github@rwbutler.com' }
  s.source           = { :git => 'https://github.com/rwbutler/LetterCase.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ross_w_butler'
  s.ios.deployment_target = '8.0'
  s.source_files = 'LetterCase/Classes/**/*'
end
