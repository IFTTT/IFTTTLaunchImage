//
//  ViewController.m
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 IFTTT. All rights reserved.
//

#import "ViewController.h"
#import <UIImage+IFTTTLaunchImage.h>

@interface ViewController ()

@property (nonatomic, strong) UIImageView *launchImageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _label = [UILabel new];
    self.label.font = [UIFont italicSystemFontOfSize:20.f];
    self.label.textColor = [UIColor redColor];
    self.label.text = @"Hello IFTTTLaunchImage!";
    self.label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    self.label.center = self.view.center;
    
    _launchImageView = [[UIImageView alloc] initWithImage:[UIImage IFTTTDefaultLaunchImage]];
    [self.view addSubview:self.launchImageView];
    
    // Other setup might happen here...
    
    [UIView animateWithDuration:2.5f
                          delay:1.f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.launchImageView.alpha = 0.f;
                     }
                     completion:^(BOOL finished) {
                         [self.launchImageView removeFromSuperview];
                     }];
    
    
}

@end
