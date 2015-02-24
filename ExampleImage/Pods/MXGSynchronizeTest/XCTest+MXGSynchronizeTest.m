//
//  XCTest+MXGSynchronizeTest.m
//
//  Created by Max Goedjen on 1/16/14.
//  Copyright (c) 2014 Clink Apps. All rights reserved.
//

#import "XCTest+MXGSynchronizeTest.h"

@implementation XCTest (MXGSynchronizeTest)

+ (void)mxg_synchronizeTest:(void (^)(BOOL *finished))test {
    BOOL testFinished = NO;
    test(&testFinished);
    while(testFinished == NO) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate distantFuture]];
    }
}

@end
