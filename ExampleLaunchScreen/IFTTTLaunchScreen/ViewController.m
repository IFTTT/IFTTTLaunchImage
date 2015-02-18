//
//  ViewController.m
//  IFTTTLaunchImageScreen
//
//  Created by Jonathan Hersh on 2/16/15.
//  Copyright (c) 2015 IFTTT. All rights reserved.
//

#import "ViewController.h"
#import <IFTTTSplashView.h>

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _label = [UILabel new];
    self.label.font = [UIFont italicSystemFontOfSize:22.f];
    self.label.textColor = [UIColor redColor];
    self.label.text = @"Hello IFTTTLaunchImage!";
    self.label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    self.label.center = self.view.center;
    
    // Other setup might happen here...
    
    [[IFTTTSplashView sharedSplash] dismissSplashWithAnimation:IFTTTSplashAnimationDrop
                                                      duration:0.75f
                                                         delay:1.5f
                                                       options:UIViewAnimationOptionCurveEaseIn
                                                    completion:nil];
    
}

@end
