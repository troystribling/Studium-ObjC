//
//  BitManipulationTests.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/26/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BitManipulation.h"

@interface BitManipulationTests : XCTestCase

@end

@implementation BitManipulationTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFlipBits {
    long flipped = [BitManipulation flipBits:4];
    NSLog(@"%@", [BitManipulation bitsToString:4]);
    NSLog(@"%@", [BitManipulation bitsToString:flipped]);
}

- (void)testIsPowerOf2 {
    NSLog(@"%@", [BitManipulation isPowerOf2:8872817] ? @"YES" : @"NO");
    NSLog(@"%@", [BitManipulation isPowerOf2:256] ? @"YES" : @"NO");
    NSLog(@"%@", [BitManipulation isPowerOf2:4294967296] ? @"YES" : @"NO");
}

- (void)testAndFromTo {
    unsigned long result = [BitManipulation andFrom:12 To:15];
    NSLog(@"result = %ld, %@", result, [BitManipulation bitsToString:result]);
}

- (void)testXorArray {
    unsigned long vals[] = {1, 2, 3};
    unsigned long result = [BitManipulation xorArray:&vals ofLength:3];
}

- (void)testTwosComplement {
    long val = 99;
    long result = [BitManipulation twosComplement:val];
    NSLog(@"val=%ld, result=%ld", val, result);
    NSLog(@"%@", [BitManipulation bitsToString:val]);
    NSLog(@"%@", [BitManipulation bitsToString:result]);
}

@end
