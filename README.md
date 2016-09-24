# NSPageControl
[![Build Status](https://travis-ci.org/nerd0geek1/NSPageControl.svg?branch=master)](https://travis-ci.org/nerd0geek1/NSPageControl)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This is PageControl Component for OS X. Inspired by UIPageControl and [BFPageControl](https://github.com/bfolder/BFPageControl).

## Demo
![Demo.gif](https://github.com/nerd0geek1/NSPageControl/raw/master/Demo.gif)

##Installation
NSPageControl supports multiple methods for installing the library in a project.

##Installation with CocoaPods
To integrate NSPageControl into your Xcode project using CocoaPods, specify it in your Podfile:
```
platform :osx, '10.9'
use_frameworks!
pod 'NSPageControl'
```

Then, run the following command:
```
$ pod install
```

## Requirements
- iOS 9.0+, OS X 10.10+
- Xcode 8.0 or above

Logger is now supporting Swift3.0.
If you want to use with Swift2.2, please use Swift2.2 branch.

##Installation with Carthage
To integrate NSPageControl into your Xcode project using Carthage, specify it in your Cartfile:
```
github "nerd0geek1/NSPageControl"
```

Then, run the following command:
```
$ carthage update
```

##Example
See Example for a working example.
Before running Example project, please execute below commands.
```
$ carthage build --no-skip-current
```

##License
This software is Open Source under the MIT license, see LICENSE for details.
