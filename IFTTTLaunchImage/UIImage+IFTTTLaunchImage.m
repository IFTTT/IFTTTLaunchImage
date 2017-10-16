//
//  UIImage+IFTTTLaunchImage.m
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 Jonathan Hersh. All rights reserved.
//

#import "UIImage+IFTTTLaunchImage.h"
#import "UIDevice+IFTTTLaunchImage.h"

NSString * const kIFTTTDefaultLaunchImageSetName = @"LaunchImage";

@implementation UIImage (IFTTTLaunchImage)

#pragma mark - Launch Image selection

+ (instancetype)IFTTTDefaultLaunchImage {
    return [self IFTTTLaunchImageNamed:kIFTTTDefaultLaunchImageSetName];
}

+ (instancetype)IFTTTLaunchImageNamed:(NSString *)name {
    NSMutableString *imageName = [NSMutableString stringWithString:name];
    
    CGFloat height = CGRectGetHeight([UIScreen mainScreen].bounds);
    
    if ([[UIDevice currentDevice] IFTTTDeviceIsiPad]) {
        if ([[UIDevice currentDevice] IFTTTDeviceIsLandscape]) {
            [imageName appendString:@"-700-Landscape"];
        } else {
            [imageName appendString:@"-700-Portrait"];
        }
        
        [imageName appendString:@"~ipad"];
    } else if (height == 568.f) {
        [imageName appendString:@"-700-568h"];
    } else if (height == 667.f) {
        [imageName appendString:@"-800-667h"];
    } else if (height == 736.f || height == 414.f) {
        if ([[UIDevice currentDevice] IFTTTDeviceIsLandscape]) {
            [imageName appendString:@"-800-Landscape-736h"];
        } else {
            [imageName appendString:@"-800-Portrait-736h"];
        }
    } else if (height == 812.f) {
        [imageName appendString:@"-1100-2436h"];
    } else {
        [imageName appendString:@"-700"];
    }
        
    return [UIImage imageNamed:imageName];
}

@end
