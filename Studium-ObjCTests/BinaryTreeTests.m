//
//  BinaryTreeTests.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/23/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BinaryTree.h"

@interface BinaryTreeTests : XCTestCase

@property BinaryTreeNode* bstRoot;
@property BinaryTreeNode* btRoot;

@end

@implementation BinaryTreeTests

- (void)setUp {
    [super setUp];
    _bstRoot = [[BinaryTreeNode alloc] init];
    _bstRoot.value = 10;
    BinaryTreeNode* n1 = [[BinaryTreeNode alloc] init];
    n1.value = 5;
    BinaryTreeNode* n2 = [[BinaryTreeNode alloc] init];
    n2.value = 1;
    BinaryTreeNode* n3 = [[BinaryTreeNode alloc] init];
    n3.value = 9;
    BinaryTreeNode* n4 = [[BinaryTreeNode alloc] init];
    n4.value = 20;
    BinaryTreeNode* n5 = [[BinaryTreeNode alloc] init];
    n5.value = 15;
    _bstRoot.left = n1;
    n1.left = n2;
    n1.right = n3;
    _bstRoot.right = n4;
    n4.left = n5;

    _btRoot = [[BinaryTreeNode alloc] init];
    _btRoot.value = 10;
    BinaryTreeNode* n21 = [[BinaryTreeNode alloc] init];
    n21.value = 21;
    BinaryTreeNode* n22 = [[BinaryTreeNode alloc] init];
    n22.value = 1;
    BinaryTreeNode* n23 = [[BinaryTreeNode alloc] init];
    n23.value = 9;
    BinaryTreeNode* n24 = [[BinaryTreeNode alloc] init];
    n24.value = 20;
    BinaryTreeNode* n25 = [[BinaryTreeNode alloc] init];
    n25.value = 15;
    _btRoot.left = n21;
    n21.left = n22;
    n21.right = n23;
    _btRoot.right = n24;
    n24.right = n25;
}

- (void)testPreorder {
    [self.bstRoot preorder:^(BinaryTreeNode* node) {
        NSLog(@"%ld", node.value);
    }];
}

- (void)testInorder {
    [self.bstRoot inorder:^(BinaryTreeNode* node) {
        NSLog(@"%ld", node.value);
    }];
}

- (void)testPostorder {
    [self.bstRoot postorder:^(BinaryTreeNode* node) {
        NSLog(@"%ld", node.value);
    }];
}

- (void)testLayerorder {
    [self.bstRoot layerorder:^(BinaryTreeNode* node) {
        NSLog(@"%ld", node.value);
    }];
}

- (void)testMaxDepth {
    NSLog(@"max depth=%ld", [self.bstRoot maxDepth]);
}

- (void)testIsBST {
    NSLog(@"is BST=%@", [self.bstRoot isBST] ? @"YES" : @"NO");
    NSLog(@"is BST=%@", [self.btRoot isBST] ? @"YES" : @"NO");
}

@end
