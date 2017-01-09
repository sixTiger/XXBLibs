//
//  XXBLibDemoTests.m
//  XXBLibDemoTests
//
//  Created by baidu on 17/1/9.
//  Copyright © 2017年 杨小兵. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XXBLibs.h"

@interface XXBLibDemoTests : XCTestCase

@end

@implementation XXBLibDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)test_IsNULL {
    BOOL value = NO;
    value = isNull(nil);
    XCTAssert(value,@"isNull error");
    value = isNull([NSNull null]);
    XCTAssert(value,@"isNull error");
    value = isNull(@"");
    XCTAssert(!value,@"isNull error");
}

- (void)test_IsEmpty {
    BOOL value = NO;
    value = isEmpty(nil);
    XCTAssert(value,@"isEmpty error");
    value = isEmpty([NSNull null]);
    XCTAssert(value,@"isNull error");
    value = isEmpty(@"");
    XCTAssert(value,@"isNull error");
    value = isEmpty(@"0");
    XCTAssert(!value,@"isNull error");
}

@end
