//
//  UIImage+IFTTTLaunchImage.h
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 Jonathan Hersh. All rights reserved.
//

@import UIKit;

/**
 *  The default launch image asset name, "LaunchImage".
 */
UIKIT_EXTERN NSString * const kIFTTTDefaultLaunchImageSetName;

@interface UIImage (IFTTTLaunchImage)

/**
 *  Return the correct launch image from your asset catalog for the user's current device
 *  using the default launch image asset name.
 *  This requires that your launch image asset in your asset catalog
 *  is named "LaunchImage".
 *
 *  @return a UIImage from your asset catalog from the 'LaunchImage' asset set
 */
+ (instancetype) IFTTTDefaultLaunchImage;

/**
 *  Return the correct launch image from your asset catalog for the user's current device
 *  using a launch image asset name that you specify.
 *
 *  @param name the name of your launch image asset in your asset catalog. 
 *  By default this is "LaunchImage" unless you've changed it manually.
 *
 *  @return a UIImage from your asset catalog from the specified launch image asset set
 */
+ (instancetype) IFTTTLaunchImageNamed:(NSString *)name;

@end
