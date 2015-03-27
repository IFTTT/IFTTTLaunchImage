//
//  IFTTTLaunchImageTests.m
//  IFTTTLaunchImageTests
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 IFTTT. All rights reserved.
//

@import UIKit;
@import XCTest;
#import <FBSnapshotTestCase.h>
#import <UIImage+IFTTTLaunchImage.h>
#import <UIDevice+IFTTTLaunchImage.h>
#import <IFTTTSplashView.h>

@interface IFTTTLaunchImageTests : FBSnapshotTestCase

@end

@implementation IFTTTLaunchImageTests

- (void)setUp {
    [super setUp];
    
//    self.recordMode = YES;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testLocatesDefaultLaunchImage {
    UIImage *defaultImage = [UIImage IFTTTDefaultLaunchImage];
    
    XCTAssertNotNil(defaultImage, @"Should have returned a default launch image");
    XCTAssertTrue([defaultImage isKindOfClass:[UIImage class]], @"Should have returned an image");
    XCTAssertFalse(CGSizeEqualToSize(defaultImage.size, CGSizeZero), @"Launch image should have a nonzero size");
}

- (void)testLaunchSnapshot {
    UIImageView *launchImageView = [[UIImageView alloc] initWithImage:[UIImage IFTTTDefaultLaunchImage]];
    FBSnapshotVerifyView(launchImageView, nil);
}

#pragma mark - Splash View

- (void)testSplashViewShowsImage {
    [[IFTTTSplashView sharedSplash] showSplash];
    FBSnapshotVerifyView([IFTTTSplashView sharedSplash], nil);
}

- (void)testSplashViewImageAccess {
    UIImage *image = [UIImage IFTTTDefaultLaunchImage];
    
    [[IFTTTSplashView sharedSplash] setImage:image];
    
    XCTAssertEqualObjects([IFTTTSplashView sharedSplash].image, image, @"Images should be equal");
}

- (void)testSplashCustomViewAccess {
    UIView *view = [UIView new];
    
    [[IFTTTSplashView sharedSplash] setCustomView:view];
    
    XCTAssertEqualObjects([IFTTTSplashView sharedSplash].customView, view, @"Views should be set and retrieved");
}

- (void)testSplashViewDismissalTypes {
    
    for (NSNumber *dismissalType in @[ @(IFTTTSplashAnimationDrop),
                                       @(IFTTTSplashAnimationFade),
                                       @(IFTTTSplashAnimationGrowFade),
                                       @(IFTTTSplashAnimationNone) ]) {
        
        XCTestExpectation *expectation = [self expectationWithDescription:
                                          [NSString stringWithFormat:@"Animation type %@", dismissalType]];
        
        [[IFTTTSplashView sharedSplash] showSplash];
        
        XCTAssertFalse([IFTTTSplashView sharedSplash].hidden, @"Splash should be visible");
        
        [[IFTTTSplashView sharedSplash] dismissSplashWithAnimation:[dismissalType unsignedIntegerValue]
                                                        completion:^
         {
             XCTAssertTrue([IFTTTSplashView sharedSplash].hidden, @"Should be hidden");
             [expectation fulfill];
         }];
        
        [self waitForExpectationsWithTimeout:5 handler:nil];
    }
}

#pragma mark - UIDevice

- (void)testIsIPhone {
    XCTAssertFalse([[UIDevice currentDevice] IFTTTDeviceIsiPad], @"This test should be run on iPhone");
}

- (void)testIsPortrait {
    XCTAssertFalse([[UIDevice currentDevice] IFTTTDeviceIsLandscape], @"This test should be run in portrait");
}

@end
