//
//  BinaryTree.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/22/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

// Queue
@interface Queue : NSObject

@property NSMutableArray* values;

- (NSInteger)count;
- (void)push:(NSInteger)val;
- (NSInteger)pop;

@end

// BinaryTreeNode
@interface BinaryTreeNode : NSObject

@property NSInteger value;
@property BinaryTreeNode* left;
@property BinaryTreeNode* right;

- (void)preorder:(void(^)(BinaryTreeNode* node))f;
- (void)postorder:(void(^)(BinaryTreeNode* node))f;
- (void)inorder:(void(^)(BinaryTreeNode* node))f;

@end
