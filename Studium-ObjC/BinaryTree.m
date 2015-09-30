//
//  BinaryTree.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/22/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "BinaryTree.h"
#import "LinkedList.h"

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
- (void)layerorder:(ListNodes*)nodes apply:(void(^)(BinaryTreeNode* node))f;

- (NSInteger)max:(BinaryTreeNode*)node;
- (NSInteger)min:(BinaryTreeNode*)node;
- (NSInteger)maxDepth:(BinaryTreeNode*)node;
- (BOOL)isBST:(BinaryTreeNode*)node;

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

- (void)layerorder:(void (^)(BinaryTreeNode *))f {
    ListNodes* nodes = [[ListNodes alloc] init];
    [nodes enqueue:self];
    [self layerorder:nodes apply:f];
}

- (void)layerorder:(ListNodes *)nodes apply:(void (^)(BinaryTreeNode *))f {
    BinaryTreeNode* node = [nodes dequeue];
    if (node == nil) {
        return;
    }
    f(node);
    [nodes enqueue:node.left];
    [nodes enqueue:node.right];
    [self layerorder:nodes apply:f];
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
    NSInteger minValue = node.value;
    if (node.left != nil) {
        NSInteger minLeft = [self min:node.left];
        if (minLeft < minValue) {
            minValue = minLeft;
        }
    }
    if (node.right != nil) {
        NSInteger minRight = [self min:node.right];
        minValue = minRight;
    }
    return minValue;
}

- (NSInteger)maxDepth {
    return [self maxDepth:self];
}

- (NSInteger)maxDepth:(BinaryTreeNode*)node {
    if (node == nil) {
        return 0;
    }
    NSInteger leftDepth = [self maxDepth:node.left];
    NSInteger rightDepth = [self maxDepth:node.right];
    return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1;
}

- (BOOL)isBST {
    return [self isBST:self];
}

- (BOOL)isBST:(BinaryTreeNode*)node {
    static BinaryTreeNode* prev = nil;
    if (node == nil) {
        return YES;
    }
    if (![self isBST:node.left]) {
        return NO;
    }
    if (prev != nil && prev.value > node.value) {
        return NO;
    }
    prev = node;
    return [self isBST:node.right];
}

- (BOOL)isBST2 {
    return YES;
}

@end
