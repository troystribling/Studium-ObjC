//
//  LinkedListTests.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/12/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LinkedList.h"

@interface LinkedListTests : XCTestCase

@end

void printIntList() {
    int count = intListCount();
    NSLog(@"start count=%d", count);
    for (int i = 0; i < count; i++) {
        int value = pop();
        NSLog(@"%d:%d", i, value);
    }
    NSLog(@"end count=%d", intListCount());
}

@implementation LinkedListTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testIntList {
    push(1);
    push(2);
    push(3);
    printIntList();
}

@end
