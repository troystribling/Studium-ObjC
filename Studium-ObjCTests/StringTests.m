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

- (void)testPangram {
    NSArray<NSString*>* sentence = @[@"The", @"quick", @"brown",
                                     @"fox",  @"jumps",  @"over",
                                     @"the", @"lazy", @"dog"];
    NSLog(@"is pangram=%@", [Pangram isPangran:sentence] ? @"YES" : @"NO");
    sentence = @[@"We", @"promptly", @"judged",
                 @"antique", @"ivory", @"buckles", @"for", @"the", @"prize"];
    NSLog(@"is pangram=%@", [Pangram isPangran:sentence] ? @"YES" : @"NO");
    sentence = @[@"We", @"promptly", @"judged", @"antique", @"ivory",
                 @"buckles", @"for", @"the", @"next", @"prize"];
    NSLog(@"is pangram=%@", [Pangram isPangran:sentence] ? @"YES" : @"NO");
}

- (void)testHasSubString {
    NSLog(@"has substring=%@", [@"hello" hasSubString:@"world"] ? @"YES" : @"NO");
    NSLog(@"has substring=%@", [@"hi" hasSubString:@"world"] ? @"YES" : @"NO");    
}

@end
