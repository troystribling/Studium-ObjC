//
//  BinarySearchTree.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/12/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "BinarySearchTreeInC.h"

static struct Node* root;
static  int _count = 0;

struct Node* updateNode(struct Node* node, int key, const char value[]);
void getNode(struct Node* node, int key, char value[]);

struct Node* maxNode(struct Node* node);
struct Node* minNode(struct Node* node);

bool isOrderedNode(struct Node* node, bool status);

void preOrderNode(struct Node* node, void (^f)(struct Node* node));
void inOrderNode(struct Node* node, void (^f)(struct Node* node));
void postOrderNode(struct Node* node, void (^f)(struct Node* node));

int count() {
    return _count;
}

void update(int key, const char value[]) {
    root = updateNode(root, key, value);
}

struct Node* updateNode(struct Node* node, int key, const char value[]) {
    if (node == nil) {
        node = (struct Node*)malloc(sizeof(struct Node));
        node->key = key;
        node->left = nil;
        node->right = nil;
        strncpy(node->value, value, 20);
        _count++;
        return node;
    }
    if (key < node->key) {
        node->left = updateNode(node->left, key, value);
    } else if (key > node->key) {
        node->right = updateNode(node->right, key, value);
    } else {
        strncpy(node->value, value, 20);
    }
    return node;
}

void get(int key, char value[]) {
    getNode(root, key, value);
}

void getNode(struct Node* node, int key, char value[]) {
    if (node == nil) {
        return;
    }
    if (key < node->key) {
        getNode(node->left, key, value);
    } else if (key > node->key) {
        getNode(node->right, key, value);
    } else {
        strncpy(value, node->value, 20);
    }
}

struct Node* max() {
    return maxNode(root);
}

struct Node* maxNode(struct Node* node) {
    if (node == nil) {
        return nil;
    }
    if (node->right == nil) {
        return node;
    } else {
        return maxNode(node->right);
    }
}

struct Node* min() {
    return minNode(root);
}

struct Node* minNode(struct Node* node) {
    if (node == nil) {
        return nil;
    }
    if (node->left == nil) {
        return node;
    } else {
        return minNode(node->left);
    }
}

bool isOrdered() {
    if (root != nil) {
        return isOrderedNode(root, true);
    } else {
        return false;
    }
}

bool isOrderedNode(struct Node* node, bool status) {
    if (node == nil) {
        return status;
    }
    if (node->left != nil) {
        if (node->left->key > node->key) {
            status = false;
        }
    }
    if (node->right != nil) {
        if (node->right->key < node->key) {
            status = false;
        }
    }
    isOrderedNode(node->left, status);
    isOrderedNode(node->right, status);
    return status;
}

void preOrder(void (^f)(struct Node* node)) {
    preOrderNode(root, f);
}

void preOrderNode(struct Node* node, void (^f)(struct Node* node)) {
    if (node == nil) {
        return;
    }
    f(node);
    preOrderNode(node->left, f);
    preOrderNode(node->right, f);
}

void inOrder(void (^f)(struct Node*)) {
    inOrderNode(root, f);
}

void inOrderNode(struct Node* node, void (^f)(struct Node* node)) {
    if (node == nil) {
        return;
    }
    inOrderNode(node->left, f);
    f(node);
    inOrderNode(node->right, f);
}

void postOrder(void (^f)(struct Node*)) {
    postOrderNode(root, f);
}

void postOrderNode(struct Node* node, void (^f)(struct Node* node)) {
    if (node == nil) {
        return;
    }
    postOrderNode(node->left, f);
    postOrderNode(node->right, f);
    f(node);
}