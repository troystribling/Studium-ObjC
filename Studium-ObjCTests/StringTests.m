//
//  StringTests.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/17/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSStringCategory.h"

@interface StringTests : XCTestCase

@end

@implementation StringTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSubStringMatch {
    NSString* testString = @"ThisIsATest";
    NSInteger index = [testString match:@"Is"];
    NSLog(@"%ld", index);
}

@end
