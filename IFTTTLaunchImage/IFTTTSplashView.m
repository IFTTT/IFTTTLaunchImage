//
//  IFTTTSplashView.m
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 IFTTT. All rights reserved.
//

#import "IFTTTSplashView.h"
#import "UIImage+IFTTTLaunchImage.h"

@interface IFTTTSplashViewController : UIViewController

@property (nonatomic, strong) UIImageView *imageView;

- (instancetype)initWithSplashImage:(UIImage *)image;

@end

@implementation IFTTTSplashView

- (instancetype)initWithSplashImage:(UIImage *)image
{
    if ((self = [super initWithFrame:CGRectZero])) {
        self.windowLevel = UIWindowLevelNormal + 1.f;
        self.hidden = YES;
        
        // We use a simple root view controller here instead of adding subviews to the window
        // because the VC gives us rotation handling for free.
        self.rootViewController = [[IFTTTSplashViewController alloc] initWithSplashImage:image];
    }
    
    return self;
}

+ (instancetype)sharedSplash
{
    static IFTTTSplashView *splashView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        splashView = [[self alloc] initWithSplashImage:[UIImage IFTTTDefaultLaunchImage]];
    });
    
    return splashView;
}

#pragma mark - Launch image

- (UIImage *)image
{
    return ((IFTTTSplashViewController *)self.rootViewController).imageView.image;
}

- (void)setImage:(UIImage *)image
{
    ((IFTTTSplashViewController *)self.rootViewController).imageView.image = image;
}

#pragma mark - Display

- (void)showSplash
{
    self.alpha = 1.f;
    self.transform = CGAffineTransformIdentity;

    [self setFrame:[[UIScreen mainScreen] bounds]];
    
    self.hidden = NO;
}

#pragma mark - Dismissal

- (void)dismissSplashWithAnimation:(IFTTTSplashAnimation)animation
                        completion:(void (^)(void))completion
{
    [self dismissSplashWithAnimation:animation
                            duration:0.6f
                          completion:completion];
}

- (void)dismissSplashWithAnimation:(IFTTTSplashAnimation)animation
                          duration:(NSTimeInterval)duration
                        completion:(void (^)(void))completion
{
    [self dismissSplashWithAnimation:animation
                            duration:duration
                               delay:0.f
                             options:UIViewAnimationOptionCurveEaseIn
                          completion:completion];
}

- (void)dismissSplashWithAnimation:(IFTTTSplashAnimation)animation
                          duration:(NSTimeInterval)duration
                             delay:(NSTimeInterval)delay
                           options:(UIViewAnimationOptions)options
                        completion:(void (^)(void))completion
{
    if (self.hidden) {
        return;
    }
    
    switch (animation) {
        case IFTTTSplashAnimationNone:
            self.hidden = YES;
            if (completion) {
                completion();
            }
            break;
            
        case IFTTTSplashAnimationFade:
        case IFTTTSplashAnimationDrop:
        case IFTTTSplashAnimationGrowFade:
            
            [UIView animateWithDuration:duration
                                  delay:delay
                                options:options
                             animations:^{
                                 
                                 if (animation == IFTTTSplashAnimationGrowFade || animation == IFTTTSplashAnimationFade) {
                                     self.alpha = 0.f;
                                 }
                                 
                                 if (animation == IFTTTSplashAnimationGrowFade) {
                                     self.transform = CGAffineTransformConcat(self.transform, CGAffineTransformMakeScale(2.f, 2.f));
                                 }
                                 
                                 if (animation == IFTTTSplashAnimationDrop) {
                                     CGFloat angle = M_PI_2;
                                     
                                     angle *= arc4random_uniform(100) / 100.f;
                                     
                                     if (arc4random_uniform(2) == 0) {
                                         angle = -angle;
                                     }
                                     
                                     CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 1.5f * CGRectGetHeight([[UIScreen mainScreen] bounds]));
                                     transform = CGAffineTransformRotate(transform, angle);
                                     self.transform = transform;
                                 }
                             }
                             completion:^(BOOL finished) {
                                 self.hidden = YES;
                                 
                                 if (completion) {
                                     completion();
                                 }
                             }];
            
            break;
    }
}

@end

@implementation IFTTTSplashViewController

- (instancetype)initWithSplashImage:(UIImage *)image
{
    if ((self = [super init])) {
        _imageView = [[UIImageView alloc] initWithImage:image];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.imageView];
    [self.imageView setFrame:self.view.bounds];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
