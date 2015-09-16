//
//  LinkedList.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/12/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListNode : NSObject

@property(nonatomic, retain) ListNode* next;
@property(nonatomic, retain) id value;

@end

@interface ListNodes : NSObject <NSFastEnumeration>

@property(nonatomic, retain) ListNode* head;
@property(nonatomic, assign) NSInteger count;
@property(nonatomic, assign) unsigned long mutations;

- (void)push:(id)node;
- (id)pop;

@end

void push(int value);
int pop();
int intListCount();