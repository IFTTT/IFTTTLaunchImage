//
//  IFTTTLaunchImageTests.m
//  IFTTTLaunchImageTests
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 IFTTT. All rights reserved.
//

@import UIKit;
@import XCTest;
#import <UIImage+IFTTTLaunchImage.h>

@interface IFTTTLaunchImageTests : XCTestCase

@end

@implementation IFTTTLaunchImageTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLocatesDefaultLaunchImage {
    UIImage *defaultImage = [UIImage IFTTTDefaultLaunchImage];
    
    XCTAssertNotNil(defaultImage, @"Should have returned a default launch image");
    XCTAssertTrue([defaultImage isKindOfClass:[UIImage class]], @"Should have returned an image");
    XCTAssertFalse(CGSizeEqualToSize(defaultImage.size, CGSizeZero), @"Launch image should have a nonzero size");
}

@end
