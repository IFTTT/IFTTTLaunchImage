//
//  AppDelegate.m
//  IFTTTLaunchImageScreen
//
//  Created by Jonathan Hersh on 2/16/15.
//  Copyright (c) 2015 IFTTT. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <IFTTTSplashView.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[IFTTTSplashView sharedSplash] showSplashWithNibName:@"LaunchScreen" bundle:nil];
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
