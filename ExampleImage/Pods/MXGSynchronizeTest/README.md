MXGSynchronizeTest
==================

Install with CocoaPods

```

target :MyAppTests, :exclusive => true do
    pod 'MXGSynchronizeTest'
end

```

## Import into test

```
#import <MXGSynchronizeTest/XCTest+MXGSynchronizeTest.h>
```

## Test

```
[XCTest mxg_synchronizeTest:^(BOOL *finished) {
    [MXGSomeService loadDataWithCompletion:^(id someObject, NSError *error) {
        XCTAssertNil(error, @"Error should be nil");
        XCTAssertNotNil(someObject, @"Response object should not be nil");
        *finished = YES;
    }];
}];
```