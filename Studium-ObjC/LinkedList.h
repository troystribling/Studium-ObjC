//
//  LinkedList.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/12/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

// single lined list
@interface ListNode : NSObject

@property(nonatomic, retain) ListNode* next;
@property(nonatomic, retain) id value;

- (BOOL)hasCycle;

@end

@interface ListNodes : NSObject

@property(nonatomic, strong) ListNode* head;
@property(nonatomic, assign) NSInteger count;

- (void)push:(id)value;
- (id)pop;

- (void)enqueue:(id)value;
- (id)dequeue;

- (void)insert:(id)value at:(NSInteger)loc;
- (void)deleteNodeAt:(NSInteger)loc;
- (void)deleteNodeWithValue:(id)value;

- (void)printReverse;
- (void)reverse;

@end


// C linked list implementation
void push(int value);
int pop();
int intListCount();

// Sorted Single Linked List
@interface SortedListNodes : NSObject

@property(nonatomic, strong) ListNode* head;
@property(nonatomic, assign) NSInteger count;

- (void)insert:(id)val;
- (ListNodes*)merge:(SortedListNodes*)list;

@end


// Double Linked List