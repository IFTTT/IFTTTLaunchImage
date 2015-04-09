//
//  UIDevice+IFTTTLaunchImage.m
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 Jonathan Hersh. All rights reserved.
//


#import "UIDevice+IFTTTLaunchImage.h"

@implementation UIDevice (IFTTTLaunchImage)

- (BOOL) IFTTTDeviceIsiPad {
    return [self userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

- (BOOL) IFTTTDeviceIsLandscape {
    return UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
}

@end
