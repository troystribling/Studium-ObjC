//
//  NSArrayCategory.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/10/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "NSArrayCategory.h"

// objective C
@implementation NSMutableArray (Extensions)

- (void)swap:(NSInteger)i with:(NSInteger)j {
    id tmp = [self objectAtIndex:i];
    [self replaceObjectAtIndex:i withObject:[self objectAtIndex:j]];
    [self replaceObjectAtIndex:j withObject:tmp];
}

- (void)reverse {
    [self reverseStartingAt:0 upTo:[self count] - 1];
}

- (void)reverseStartingAt:(NSInteger)i upTo:(NSInteger)j {
    NSInteger n = (j-i)/2;
    for (NSInteger k = 0; k <= n; k++) {
        NSLog(@"n=%ld, i=%ld, j=%ld, k=%ld", n, i, j, k);
        [self swap:i+k with:j-k];
    }
}

- (void)rotateAmount:(NSInteger)i {
    [self reverse];
    [self reverseStartingAt:0 upTo:i-1];
    [self reverseStartingAt:i upTo:[self count] - 1];
}

- (NSMutableArray*)rotateNaiveAmount:(NSInteger)i {
    NSMutableArray* rev1 = [self reverseNaiveFrom:0 to:[self count] - 1];
    NSMutableArray* rev2 = [rev1 reverseNaiveFrom:0 to:i-1];
    return [rev2 reverseNaiveFrom:i to:[self count] - 1];
}

- (NSMutableArray*)reverseNaiveFrom:(NSInteger)i to:(NSInteger)j {
    NSInteger n = j - i;
    NSMutableArray* result = [NSMutableArray arrayWithArray:self];
    for (NSInteger k = 0; k <= n; k++) {
        [result replaceObjectAtIndex:i+k withObject:[self objectAtIndex:j-k]];
    }
    return result;
}

@end

// C
void swap(int vals[], int i, int j) {
    int tmp = vals[i];
    vals[i] = vals[j];
    vals[j] = tmp;
}

void reverse(int vals[], int size) {
    reverseRange(vals, 0, size-1);
}

void reverseRange(int vals[], int i, int j) {
    int n = (j - i)/2;
    for (int k = 0; k <= n; k++) {
        swap(vals, i+k, j-k);
    }
}

void rotate(int vals[], int size, int amount) {
    reverse(vals, size);
    reverseRange(vals, 0, amount-1);
    reverseRange(vals, amount, size-1);
}