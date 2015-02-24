# IFTTTLaunchImage

[![Build Status](https://travis-ci.org/IFTTT/IFTTTLaunchImage.svg?branch=master)](https://travis-ci.org/IFTTT/IFTTTLaunchImage) [![Coverage Status](https://coveralls.io/repos/IFTTT/IFTTTLaunchImage/badge.svg)](https://coveralls.io/r/IFTTT/IFTTTLaunchImage)

[Asset Catalogs](https://developer.apple.com/library/ios/recipes/xcode_help-image_catalog-1.0/Recipe.html) in Xcode 5+ are pretty neat. You can keep all of your app's assets in one place, you can see at a glance which image scales you're using, and you can even use asset catalogs for your app's icon and launch image.

When your app first launches, you'll probably have some loading or setup to do before you can display your initial user interface. Instead of showing your user a broken or half-loaded interface, why not animate a smooth transition from your app's launch image to your fully loaded user interface? Unlike normal images in your asset catalog, unfortunately it is not obvious how to reach into your asset catalog to programmatically access the correct launch image for the user's current device.

`IFTTTLaunchImage` is a set of classes that simplify working with launch images in your asset catalog as well as nib-based launch screens.

## What's in the Box

- `UIImage+IFTTTLaunchImage` and `UIDevice+IFTTTLaunchImage` are simple categories that make it easy to access the correct launch image for the user's current device.
- `IFTTTSplashView` is a view containing your launch image or launch screen that you can display when your app launches. When your app has finished launching and loading its initial interface, the splash view can be dismissed using one of several nifty built-in animations.

`IFTTTSplashView` also has full support for `UINib`-based Launch Screens as well as splash screens that display a custom `UIView`. Check out `IFTTTSplashView.h` for more details.

## Examples

`ExampleImage` is an app that animates from its launch image to its initial interface. 

`ExampleLaunchScreen` is an app that animates from its nib-based launch screen to its initial interface.

To try the example projects:

```bash
pod try IFTTTLaunchImage
```

Or just `open IFTTTLaunchImage.xcworkspace` or `open IFTTTLaunchScreen.xcworkspace`.

Here it is in action in the `ExampleImage` app, using the built-in animation `IFTTTSplashAnimationDrop`:

![IFTTTLaunchImage](https://github.com/IFTTT/IFTTTLaunchImage/blob/master/launch.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the `Example` directory.

## Installation

IFTTTLaunchImage is available through [CocoaPods](http://cocoapods.org). To install
it, add the following line to your `Podfile`:

    pod "IFTTTLaunchImage"

## Author

[Jonathan Hersh](https://github.com/jhersh)

## License

IFTTTLaunchImage is available under the MIT license. See the LICENSE file for more info.

Copyright © 2015 IFTTT Inc.
