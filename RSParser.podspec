#
#  Be sure to run `pod spec lint RSParser.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "RSParser"
  s.version      = "1.0"
  s.summary      = "This framework was developed for Evergreen"

  s.description  = "Parsers available for RSS, Atom, OPML, Internet Dates, HTML metadata and links, and HTML entities.
  It also includes Objective-C wrappers for libXML2’s XML SAX and HTML SAX parsers. 
  You can write your own parsers on top of these."

  s.homepage     = "https://github.com/brentsimmons/RSParser"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Brent Simmons" => "brent@ranchero.com" }

  #  When using multiple platforms
  s.ios.deployment_target = "9.3"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  
  s.source       = { :git => "https://github.com/brentsimmons/RSParser.git", :tag => "#{s.version}" }
  s.source_files  = "Sources", "Sources/**/*.{h,m,swift}"
  s.library   = "xml2"
  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

end
