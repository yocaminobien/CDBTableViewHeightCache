#
# Be sure to run `pod lib lint CDBTableViewHeightCache.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

@version = "0.0.1"

Pod::Spec.new do |s|
  s.name             = "CDBTableViewHeightCache"
  s.version          = @version
  s.summary          = "Use it to cache a height of table view cells."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  Use it to cache a height of autolayout based cells in table view to reduce height calculation time when table refreshes itself. Meant to be a support for iOS 8-9 table view logic that makes table jerks on scroll. The source of problem sometime in calculating heightForRowAtIndexPath 3 times for every single cell.
                       DESC
  s.homepage         = "https://github.com/yocaminobien/CDBTableViewHeightCache"
  s.license          = 'MIT'
  s.author           = { "estbyright" => "estbyright@gmail.com" }
  s.source           = { :git => "https://github.com/yocaminobien/CDBTableViewHeightCache.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'CDBTableViewHeightCache' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
