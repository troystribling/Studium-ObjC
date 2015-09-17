//
//  LinkedList.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/12/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "LinkedList.h"

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

@implementation ListNode
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
    self.head = oldNode.next;
    self.count--;
    return oldNode.value;
}

@end