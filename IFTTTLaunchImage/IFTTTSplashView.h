//
//  IFTTTSplashView.h
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 IFTTT. All rights reserved.
//

@import UIKit;

/**
 *  A splash view that you can display when your app launches.
 *  When your app has finished launching and loading its initial interface, the splash
 *  view may be dismissed using one of several built-in animations.
 *
 *  The splash view has 3 modes of operation:
 *
 *  1) Launch image - this is the default mode. Invoke @c showSplash to display the splash
 *  view immediately using the launch image named 'LaunchImage' from your asset catalog.
 *  You may assign to the @c image property to use a different launch image on the splash screen,
 *  e.g. if your launch image in your asset catalog has a name other than 'LaunchImage'.
 *
 *  2) Launch Screen - if you are using a nib file for your Launch Screen, invoke
 *  @c showSplashWithNib:bundle: to display the splash view immediately using the nib name and bundle specified.
 *  This will assign the nib's view to the splash screen's @c customView property.
 *
 *  3) Custom View - you may use any custom view for the splash screen. Assign your view to the
 *  @c customView property, then invoke @c showSplash.
 */
@interface IFTTTSplashView : UIWindow

typedef NS_ENUM(NSUInteger, IFTTTSplashAnimation) {
    IFTTTSplashAnimationNone,       // No animation
    IFTTTSplashAnimationFade,       // Fade out
    IFTTTSplashAnimationGrowFade,   // Grow and fade out
    IFTTTSplashAnimationDrop,       // Rotate and drop
};

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
 *  Any custom view displayed by the splash view.
 *  If you show the splash view with @c showSplashWithNib:bundle:
 *  then this property will automatically be set to the view in your custom nib file.
 *  You may also assign to this property to use a custom view for your splash screen.
 */
@property (nonatomic, strong) UIView *customView;

/**
 *  Display the splash view immediately on top of the main window.
 *  Uses the image specified in the @c image property, which defaults to 
 *  the image in your asset catalog named 'LaunchImage'.
 */
- (void) showSplash;

/**
 *  Display the splash view immediately on top of the main window.
 *  Uses the nib file specified.
 *
 *  @param nibName the nib name for your launch screen
 *  @param nibBundle the bundle containing your launch screen nib. Specify @c nil to use the main bundle.
 */
- (void) showSplashWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle;

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
