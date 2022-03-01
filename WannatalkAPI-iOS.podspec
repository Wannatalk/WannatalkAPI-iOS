Pod::Spec.new do |s|
  #1.
  s.name            = "WTExternalSDK"
  #2.
  s.version         = "1.6.5"
  #3.
  s.summary         = "'WTExternalSDK' framework"
  #4.
  s.homepage        = "https://wannatalk.ai"
  #5.
  s.license         = "GNU GENERAL PUBLIC LICENSE"
  #6.
  s.author          = "Wannatalk"
  #7.
  s.platform        = :ios, "9.0"
  #8.
  s.source          = { :git => "https://github.com/edzehoo/WannatalkAPI-iOS.git", :tag => s.version }
  #9.
  #s.source_files    = ""
  #10.
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '/Applications/Xcode.app/Contents/Developer/Library/Frameworks' }
  #11.
  s.vendored_frameworks = 'WannatalkAPI-iOS/WTExternalSDK.xcframework'
end
