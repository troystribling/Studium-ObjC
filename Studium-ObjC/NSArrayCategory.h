//
//  NSArrayCategory.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/10/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Extensions)

- (void)swap:(NSInteger)i with:(NSInteger)j;
- (void)reverse;
- (void)reverseStartingAt:(NSInteger)i upTo:(NSInteger)j;
- (void)rotateAmount:(NSInteger)i;

@end

void swap(int vals[], int i, int j);
void reverse(int vals[], int size);
void reverseRange(int vals[], int i, int j);
void rotate(int vals[], int size, int amount);