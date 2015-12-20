# CDBTableViewHeightCache

Use it to cache a height of autolayout based cells in table view to reduce height calculation time when table refreshes itself. Meant to be a support for iOS 8-9 table view logic that makes table jerks on scroll. The source of problem sometime in calculating heightForRowAtIndexPath 3 times for every single cell.

[![CI Status](http://img.shields.io/travis/estbyright/CDBTableViewHeightCache.svg?style=flat)](https://travis-ci.org/estbyright/CDBTableViewHeightCache)
[![Version](https://img.shields.io/cocoapods/v/CDBTableViewHeightCache.svg?style=flat)](http://cocoapods.org/pods/CDBTableViewHeightCache)
[![License](https://img.shields.io/cocoapods/l/CDBTableViewHeightCache.svg?style=flat)](http://cocoapods.org/pods/CDBTableViewHeightCache)
[![Platform](https://img.shields.io/cocoapods/p/CDBTableViewHeightCache.svg?style=flat)](http://cocoapods.org/pods/CDBTableViewHeightCache)

##TODO
* Readme HOWTO
* Example project
* Implement tests for rows

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CDBTableViewHeightCache is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CDBTableViewHeightCache"
```

## Author

Kanstantsin Bucha, yocaminobien@gmail.com

## License

CDBTableViewHeightCache is available under the MIT license. See the LICENSE file for more info.
