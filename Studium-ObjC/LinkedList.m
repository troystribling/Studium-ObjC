//
//  LinkedList.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/12/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "LinkedList.h"

// C Linked list implementaion
typedef struct IntNode {
    struct IntNode* next;
    int value;
} IntNode;


static IntNode* firstIntNode;
static int _intListCount = 0;

void push(int value) {
    IntNode* newNode = (IntNode*)malloc(sizeof(IntNode));
    newNode->value = value;
    newNode->next = firstIntNode;
    firstIntNode = newNode;
    _intListCount++;
}

int pop() {
    IntNode* poppedNode = firstIntNode;
    int value = poppedNode->value;
    firstIntNode = poppedNode->next;
    free(poppedNode);
    _intListCount--;
    return value;
}

int intListCount() {
    return _intListCount;
}

// single liked list node
@implementation ListNode

- (BOOL)hasCycle {
    ListNode* current = self;
    NSMutableSet* nodes = [NSMutableSet set];
    while (current) {
        if ([nodes containsObject:current]) {
            return YES;
        } else {
            [nodes addObject:current];
        }
        current = current.next;
    }
    return NO;
}

@end

// single linked list
@interface ListNodes ()

- (void)printReverse:(ListNode*)node;

@end

@implementation ListNodes

- (void)push:(id)value {
    ListNode* newNode = [[ListNode alloc] init];
    newNode.value = value;
    newNode.next = self.head;
    self.head = newNode;
    self.count++;
}

- (id)pop {
    ListNode* oldNode = self.head;
    if (oldNode == nil) {
        return nil;
    }
    self.head = oldNode.next;
    self.count--;
    return oldNode.value;
}

- (void)enqueue:(id)value {
    if (value == nil) {
        return;
    }
    ListNode* lastNode = self.head;
    ListNode* newNode = [[ListNode alloc] init];
    newNode.value = value;
    if (lastNode == nil) {
        self.head = newNode;
    } else {
        while (true) {
            if (lastNode.next == nil) {
                break;
            } else {
                lastNode = lastNode.next;
            }
        }
        lastNode.next = newNode;
    }
    self.count++;
}

- (id)dequeue {
    return [self pop];
}

- (void)insert:(id)value at:(NSInteger)loc {
    ListNode* current = self.head;
    ListNode* prev = nil;
    NSInteger count = 0;
    while (current.next) {
        if (loc == count) {
            break;
        }
        count++;
        prev = current;
        current = current.next;
    }
    if (current != nil) {
        ListNode* newNode = [[ListNode alloc] init];
        newNode.value = value;
        newNode.next = current;
        if (prev == nil) {
            self.head = newNode;
        } else {
            prev.next = newNode;
        }
    }
}

- (void)deleteNodeAt:(NSInteger)loc {
    ListNode* current = self.head;
    ListNode* prev = nil;
    NSInteger count = 0;
    while (current) {
        if (count == loc) {
            break;
        }
        count++;
        prev = current;
        current = current.next;
    }
    if (current != nil) {
        if (prev != nil) {
            prev.next = current.next;
        } else {
            self.head = current.next;
        }
    }
}

- (void)deleteNodeWithValue:(id)value {
    ListNode* current = self.head;
    ListNode* prev = nil;
    while (current) {
        if ([current.value compare:value] == NSOrderedSame) {
            break;
        }
        prev = current;
        current = current.next;
    }
    if (current != nil) {
        if (prev != nil) {
            prev.next = current.next;
        } else {
            self.head = current.next;
        }
    }
}

- (void)printReverse {
    [self printReverse:self.head];
}

- (void)printReverse:(ListNode *)node {
    if (node == nil) {
        return;
    }
    [self printReverse:node.next];
    NSLog(@"value=%@", node.value);
}

- (void)reverse {
    ListNode* prev = nil;
    ListNode* next = nil;
    ListNode* current = self.head;
    while (current) {
        next = current.next;
        current.next = prev;
        prev = current;
        current = next;
    }
    self.head = prev;
}

@end

// sorted linked list
@implementation SortedListNodes

- (void)insert:(id)val {
    ListNode* newNode = [[ListNode alloc] init];
    newNode.value = val;
    if (self.head == nil) {
        self.head = newNode;
        return;
    }
    ListNode* current = self.head;
    ListNode* prev = nil;
    while (current) {
        if ([current.value compare:val] == NSOrderedDescending) {
            break;
        }
        prev = current;
        current = current.next;
    }
    newNode.next = current;
    if (prev != nil) {
        prev.next = newNode;
    } else {
        self.head = newNode;
    }
}

- (ListNodes*)merge:(SortedListNodes*)list {
    ListNodes* mergedList = [[ListNodes alloc] init];
    ListNode* left = self.head;
    ListNode* right = list.head;
    while (left || right) {
        if (left == nil) {
            [mergedList push:right.value];
            right = right.next;
        } else if (right == nil) {
            [mergedList push:left.value];
            left = left.next;
        } else if ([left.value compare:right.value] == NSOrderedAscending) {
            [mergedList push:left.value];
            left = left.next;
        } else {
            [mergedList push:right.value];
            right = right.next;
        }
    }
    return mergedList;
}

@end
