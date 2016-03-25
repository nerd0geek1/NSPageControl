#
#  Be sure to run `pod spec lint NSPageControl.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "NSPageControl"
  s.version      = "0.0.1"
  s.summary      = "A page control for OS X written in Swift"
  s.description  = <<-DESC
    NSPageControl is simple page control for OS X. Most of the methods are derived from the UIPageControl class in iOS.
                   DESC
  s.homepage     = "https://github.com/nerd0geek1/NSPageControl"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Kohei Tabata" => "nerd0geek1@gmail.com" }
  s.platform     = :osx, "10.9"
  s.source       = { :git => "https://github.com/nerd0geek1/NSPageControl.git", :tag => "v0.0.1" }
  s.source_files = "Classes", "NSPageControl/*.{swift}"
end
