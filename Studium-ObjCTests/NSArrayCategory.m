//
//  NSArrayCategory.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/10/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArrayCategory.h"

void printIntArray(int vals[], int size) {
    for (int i=0; i < size; i++) {
        NSLog(@"i=%d, val=%d", i, vals[i]);
    }
}

@interface NSArrayCategory : XCTestCase

@property NSMutableArray* testArray;

@end

@implementation NSArrayCategory

- (void)setUp {
    [super setUp];
    _testArray = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"]];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSwap {
    [self.testArray swap:2 with:8];
    NSLog(@"%@", self.testArray);
}

- (void)testReverse {
    [self.testArray reverse];
    NSLog(@"%@", self.testArray);
}

- (void)testReverseStartingAtUpTo {
    [self.testArray reverseStartingAt:1 upTo:[self.testArray count] - 1];
    NSLog(@"%@", self.testArray);
}

- (void)testRotateAmount {
    [self.testArray rotateAmount:3];
    NSLog(@"%@", self.testArray);
}

- (void)testCSwap {
    int vals[] = {1,2,3,4,5,6,7,8,9,10};
    swap(vals, 2, 7);
    printIntArray(vals, 10);
}

- (void)testCReverse {
    int vals[] = {1,2,3,4,5,6,7,8,9,10};
    reverse(vals, 10);
    printIntArray(vals, 10);
}

- (void)testCReverseRange {
    int vals[] = {1,2,3,4,5,6,7,8,9,10};
    reverseRange(vals, 3, 8);
    printIntArray(vals, 10);
}

- (void)testCRotate {
    int vals [] = {1,2,3,4,5,6,7,8,9,10};
    rotate(vals, 10, 4);
    printIntArray(vals, 10);
}

@end
