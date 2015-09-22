//
//  SortTests.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/18/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Sort.h"

@interface SortTests : XCTestCase

@property NSMutableArray* vals;

@end

@implementation SortTests

- (void)setUp {
    [super setUp];
    _vals = [NSMutableArray arrayWithArray:
             @[[NSNumber numberWithInt:6],
               [NSNumber numberWithInt:2],
               [NSNumber numberWithInt:8],
               [NSNumber numberWithInt:1],
               [NSNumber numberWithInt:3],
               [NSNumber numberWithInt:7]]];

}

- (void)tearDown {
    [super tearDown];
}

- (void)testMergeSort {
    NSLog(@"%@", self.vals);
    [self.vals mergeSort];
    NSLog(@"%@", self.vals);
}

- (void)testQuickSort {
    NSLog(@"%@", self.vals);
    [self.vals quickSort];
    NSLog(@"%@", self.vals);
}


@end
