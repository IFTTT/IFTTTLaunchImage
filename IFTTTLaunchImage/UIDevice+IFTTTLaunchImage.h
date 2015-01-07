//
//  UIDevice+IFTTTLaunchImage.h
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 Jonathan Hersh. All rights reserved.
//

@import UIKit;

@interface UIDevice (IFTTTLaunchImage)

/**
 *  Determine whether the current device is an iPad.
 *
 *  @return YES if the current device is an iPad; NO if not
 */
- (BOOL) IFTTTDeviceIsiPad;

/**
 *  Determine whether the device orientation is currently landscape.
 *
 *  @return YES if the device is currently oriented in landscape; NO if portrait
 */
- (BOOL) IFTTTDeviceIsLandscape;

@end
