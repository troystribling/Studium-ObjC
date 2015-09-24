//
//  BinaryTree.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/22/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "BinaryTree.h"

// Queue
@implementation Queue

- (NSInteger)count {
    return [self.values count];
}

- (void)push:(NSInteger)val {
    [self.values addObject:[NSNumber numberWithInteger:val]];
}

- (NSInteger)pop {
    NSNumber* val = [self.values lastObject];
    [self.values removeLastObject];
    return [val integerValue];
}

@end

// BinaryTreeNode
@interface BinaryTreeNode ()

- (void)preorder:(BinaryTreeNode*)node apply:(void(^)(BinaryTreeNode* node))f;
- (void)postorder:(BinaryTreeNode*)node apply:(void(^)(BinaryTreeNode* node))f;
- (void)inorder:(BinaryTreeNode*)node apply:(void(^)(BinaryTreeNode* node))f;

- (NSInteger)max:(BinaryTreeNode*)node;
- (NSInteger)min:(BinaryTreeNode*)node;

@end

@implementation BinaryTreeNode

- (void)preorder:(void(^)(BinaryTreeNode* node))f {
    [self preorder:self apply:f];
}

- (void)preorder:(BinaryTreeNode*)node apply:(void(^)(BinaryTreeNode* node))f {
    if (node == nil) {
        return;
    }
    f(node);
    [self preorder:node.left apply:f];
    [self preorder:node.right apply:f];
}

- (void)postorder:(void(^)(BinaryTreeNode* node))f {
    [self postorder:self apply:f];
}

- (void)postorder:(BinaryTreeNode*)node apply:(void(^)(BinaryTreeNode* node))f {
    if (node == nil) {
        return;
    }
    [self postorder:node.left apply:f];
    [self postorder:node.right apply:f];
    f(node);
}

- (void)inorder:(void(^)(BinaryTreeNode* node))f {
    [self inorder:self apply:f];
}

- (void)inorder:(BinaryTreeNode*)node apply:(void(^)(BinaryTreeNode* node))f {
    if (node == nil) {
        return;
    }
    [self inorder:node.left apply:f];
    f(node);
    [self inorder:node.right apply:f];
}

- (NSInteger)max {
    return [self max:self];
}

- (NSInteger)max:(BinaryTreeNode*)node {
    NSInteger maxValue = node.value;
    if (node.left != nil) {
        NSInteger maxLeft = [self max:node.left];
        if (maxLeft > maxValue ) {
            maxValue = maxLeft;
        }
    }
    if (node.right != nil) {
        NSInteger maxRight = [self max:node.right];
        if (maxRight > maxValue) {
            maxValue = maxRight;
        }
    }
    return maxValue;
}

- (NSInteger)min {
    return [self min:self];
}

- (NSInteger)min:(BinaryTreeNode*)node {
    return 0;
}

- (BOOL)isBST {
    return NO;
}

- (BOOL)isBST:(BinaryTreeNode*)node min:(NSInteger)min max:(NSInteger)max {
    if (node == nil) {
        return YES;
    }
    return NO;
}

@end
