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
#import <IFTTTSplashView.h>

@interface IFTTTLaunchImageTests : FBSnapshotTestCase

@end

@implementation IFTTTLaunchImageTests

- (void)setUp {
    [super setUp];
    
    self.renderAsLayer = YES;
    
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

- (void)testSplashView {
    [[IFTTTSplashView sharedSplash] showSplash];
    FBSnapshotVerifyView([IFTTTSplashView sharedSplash], nil);
}

@end
