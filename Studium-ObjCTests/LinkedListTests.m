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

@property ListNodes* nodes;

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
    _nodes = [[ListNodes alloc] init];
    [self.nodes push:@"Node 1"];
    [self.nodes push:@"Node 2"];
    [self.nodes push:@"Node 3"];
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

-(void)testListNodes {
    ListNode* current = self.nodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
}

- (void)testEnqueueNode {
    ListNodes* nodes = [[ListNodes alloc] init];
    [nodes enqueue:@"Node 1"];
    [nodes enqueue:@"Node 2"];
    [nodes enqueue:@"Node 3"];
    ListNode* current = nodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
    
}

- (void)testPrintReverse {
    ListNode* current = self.nodes.head;
    while(current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
    [self.nodes printReverse];
}

- (void)testReverse {
    ListNode* current = self.nodes.head;
    while(current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
    [self.nodes reverse];
    current = self.nodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
}

- (void)testInsertAt {
    ListNode* current = self.nodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
    [self.nodes insert:@"Node 10" at:1];
    current = self.nodes.head;
    while(current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
}

- (void)testDeleteNodeAt {
    ListNode* current = self.nodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
    [self.nodes deleteNodeAt:2];
    current = self.nodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
}

- (void)testDeleteNodeWithvalue {
    ListNode* current = self.nodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
    [self.nodes deleteNodeWithValue:@"Node 2"];
    current = self.nodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
}

@end
