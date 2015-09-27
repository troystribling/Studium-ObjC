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
@property SortedListNodes* sortedNodes;

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
    _sortedNodes = [[SortedListNodes alloc] init];
    [self.sortedNodes insert:[NSNumber numberWithInteger:5]];
    [self.sortedNodes insert:[NSNumber numberWithInteger:10]];
    [self.sortedNodes insert:[NSNumber numberWithInteger:1]];
    [self.sortedNodes insert:[NSNumber numberWithInteger:4]];
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

- (void)testSortedList {
    ListNode* current = self.sortedNodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
}

- (void)testMergeSortedList {
    SortedListNodes* mergeList = [[SortedListNodes alloc] init];
    [self.sortedNodes insert:[NSNumber numberWithInteger:2]];
    [self.sortedNodes insert:[NSNumber numberWithInteger:12]];
    [self.sortedNodes insert:[NSNumber numberWithInteger:14]];
    [self.sortedNodes insert:[NSNumber numberWithInteger:7]];
    ListNode* current = self.sortedNodes.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
    current = mergeList.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
    ListNodes* merged = [self.sortedNodes merge:mergeList];
    current = merged.head;
    while (current) {
        NSLog(@"%@", current.value);
        current = current.next;
    }
}

- (void)testHasCycle {
    ListNode* noCycle0 = [[ListNode alloc] init];
    ListNode* noCycle1 = [[ListNode alloc] init];
    ListNode* noCycle2 = [[ListNode alloc] init];
    ListNode* noCycle3 = [[ListNode alloc] init];
    noCycle0.value = [NSNumber numberWithInt:1];
    noCycle1.value = [NSNumber numberWithInt:2];
    noCycle2.value = [NSNumber numberWithInt:4];
    noCycle3.value = [NSNumber numberWithInt:6];
    noCycle0.next = noCycle1;
    noCycle1.next = noCycle2;
    noCycle2.next = noCycle3;
    NSLog(@"%@", [noCycle0 hasCycle] ? @"YES" : @"NO");


    ListNode* cycle0 = [[ListNode alloc] init];
    ListNode* cycle1 = [[ListNode alloc] init];
    ListNode* cycle2 = [[ListNode alloc] init];
    ListNode* cycle3 = [[ListNode alloc] init];
    ListNode* cycle4 = [[ListNode alloc] init];
    cycle0.value = [NSNumber numberWithInt:1];
    cycle1.value = [NSNumber numberWithInt:2];
    cycle2.value = [NSNumber numberWithInt:4];
    cycle3.value = [NSNumber numberWithInt:6];
    cycle4.value = [NSNumber numberWithInt:9];
    cycle0.next = cycle1;
    cycle1.next = cycle2;
    cycle2.next = cycle3;
    cycle3.next = cycle4;
    cycle4.next = cycle2;
    NSLog(@"%@", [cycle0 hasCycle] ? @"YES" : @"NO");

}

@end
