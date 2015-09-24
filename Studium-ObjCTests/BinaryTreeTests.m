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
    n4.right = n5;
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

@end
