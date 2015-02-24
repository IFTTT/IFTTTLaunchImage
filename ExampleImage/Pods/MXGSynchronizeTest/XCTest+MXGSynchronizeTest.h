//
//  XCTest+MXGSynchronizeTest.h
//
//  Created by Max Goedjen on 1/16/14.
//  Copyright (c) 2014 Clink Apps. All rights reserved.
//

@import XCTest;

@interface XCTest (MXGSynchronizeTest)

+ (void)mxg_synchronizeTest:(void (^)(BOOL *finished))test;

@end
