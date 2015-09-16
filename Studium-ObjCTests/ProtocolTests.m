//
//  ProtocolTests.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/15/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ProtocolExercises.h"

@interface ProtocolTests : XCTestCase

@end

@implementation ProtocolTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testProtocolExercises {
    ProtocolExercises* proto = [[ProtocolExercises alloc] init];
    [proto doThing];
}

- (void)testManaged {
    Managed* managed = [[Managed alloc] init];
    [managed.manager manage];
    [managed.manager fire];
}

- (void)testFired {
    Fired* fired = [[Fired alloc] init];
    [fired.manager manage];
    [fired.manager fire];
}
@end
