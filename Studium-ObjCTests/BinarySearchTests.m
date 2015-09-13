//
//  BinarySearchTests.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/12/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BinarySearchTree.h"

@interface BinarySearchTests : XCTestCase

@end

@implementation BinarySearchTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCBinaryTree {
    update(100, "Oranges");
    update(30, "Figs");
    update(120, "Watermelon");
    update(50, "Grape");
    update(110, "Plum");
    update(10, "Apples");
    update(21, "Peach");
    NSLog(@"%d", count());
    NSLog(@"In Order");
    inOrder(^(struct Node* node) {
        NSLog(@"%d", node->key);
    });
    NSLog(@"Pre Order");
    preOrder(^(struct Node* node) {
        NSLog(@"%d", node->key);
        
    });
    NSLog(@"Post Order");
    postOrder(^(struct Node* node) {
        NSLog(@"%d", node->key);
    });
    bool status = isOrdered();
    NSLog(@"isOrdered=%d", status);
    struct Node* minNode = min();
    NSLog(@"Min = %d", minNode->key);
    struct Node* maxNode = max();
    NSLog(@"Max = %d", maxNode->key);
    NSLog(@"Reverse Tree");
    postOrder(^(struct Node* node) {
        struct Node* tmp = node->left;
        node->left = node->right;
        node->right = tmp;
    });
    inOrder(^(struct Node* node) {
        NSLog(@"%d", node->key);
    });
    status = isOrdered();
    NSLog(@"isOrdered=%d", status);
}

@end
