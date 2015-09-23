//
//  BinarySearchTree.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/12/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Node {
    struct Node* left;
    struct Node* right;
    int key;
    char value[20];
};

int count();

void update(int key, const char value[]);
void get(int key, char value[]);

struct Node* max();
struct Node* min();

bool isOrdered();

void preOrder(void (^f)(struct Node* node));
void inOrder(void (^f)(struct Node* node));
void postOrder(void (^f)(struct Node* node));
