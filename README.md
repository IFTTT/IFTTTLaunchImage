# IFTTTLaunchImage

[![Build Status](https://travis-ci.org/IFTTT/IFTTTLaunchImage.svg?branch=master)](https://travis-ci.org/IFTTT/IFTTTLaunchImage)

[Asset Catalogs](https://developer.apple.com/library/ios/recipes/xcode_help-image_catalog-1.0/Recipe.html) in Xcode 5+ are pretty neat. You can keep all of your app's assets in one place, you can see at a glance which image scales you're using, and you can even use asset catalogs for your app's icon and launch image.

When your app first launches, you'll probably have some loading or setup to do before you can display your initial user interface. Instead of showing your user a broken or half-loaded interface, why not animate a smooth transition from your app's launch image to your fully loaded user interface? Unlike normal images in your asset catalog, unfortunately it is not obvious how to reach into your asset catalog to programmatically access the correct launch image for the user's current device.

`IFTTTLaunchImage` is a simple category on `UIImage` that aims to solve exactly this problem. Check out the `Example` app for an app that, upon launch, immediately (re)displays its launch image, then animates from the launch image to its initial interface. 

Here it is in action in the `Example` app:

![IFTTTLaunchImage](https://github.com/IFTTT/IFTTTLaunchImage/blob/master/launch.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the `Example` directory.

## Installation

IFTTTLaunchImage is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your `Podfile`:

    pod "IFTTTLaunchImage"

## Author

[Jonathan Hersh](https://github.com/jhersh)

## License

IFTTTLaunchImage is available under the MIT license. See the LICENSE file for more info.

Copyright 2015 IFTTT Inc.
