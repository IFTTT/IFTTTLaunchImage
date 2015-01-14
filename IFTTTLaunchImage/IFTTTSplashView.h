//
//  IFTTTSplashView.h
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 IFTTT. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSUInteger, IFTTTSplashAnimation) {
    IFTTTSplashAnimationNone,       // No animation
    IFTTTSplashAnimationFade,       // Fade out
    IFTTTSplashAnimationGrowFade,   // Grow and fade out
    IFTTTSplashAnimationDrop,       // Rotate and drop
};

@interface IFTTTSplashView : UIWindow

/**
 *  The shared splash view. Use this accessor rather than creating your own instance.
 *
 *  @return the shared splash view
 */
+ (instancetype) sharedSplash;

/**
 *  The image displayed by the splash view. By default, this is the image in your
 *  asset catalog named 'LaunchImage'. 
 *  Assign to this property to use another image, e.g. if your launch 
 *  image has a different name.
 */
@property (nonatomic, strong) UIImage *image;

/**
 *  Display the splash view immediately on top of the main window.
 */
- (void) showSplash;

/**
 *  Dismiss the splash view with the specified animation over a standard duration.
 *
 *  @param animation the animation to use
 *  @param completion optional completion block
 */
- (void) dismissSplashWithAnimation:(IFTTTSplashAnimation)animation
                         completion:(void (^)(void))completion;

/**
 *  Dismiss the splash view with the specified animation over a custom duration.
 *
 *  @param animation the animation to use
 *  @param duration  the duration of the dismissal animation
 *  @param completion optional completion block
 */
- (void) dismissSplashWithAnimation:(IFTTTSplashAnimation)animation
                           duration:(NSTimeInterval)duration
                         completion:(void (^)(void))completion;

/**
 *  Dismiss the splash view with the specified animation, after an initial delay,
 *  over a custom duration.
 *
 *  @param animation  the animation to use
 *  @param duration   the duration of the dismissal animation
 *  @param delay      the delay to wait before dismissing
 *  @param options    any animation options for the dismissal
 *  @param completion optional completion block
 */
- (void) dismissSplashWithAnimation:(IFTTTSplashAnimation)animation
                           duration:(NSTimeInterval)duration
                              delay:(NSTimeInterval)delay
                            options:(UIViewAnimationOptions)options
                         completion:(void (^)(void))completion;

@end
