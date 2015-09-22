//
//  Sort.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/18/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "Sort.h"
#import "NSArrayCategory.h"

@implementation NSMutableArray (MergeSort)

- (void)mergeFromLo:(NSInteger)lo toHi:(NSInteger)hi {
    NSInteger mid = lo + (hi - lo)/2;
    NSMutableArray* tmp = [NSMutableArray arrayWithArray:self];
    NSInteger i = lo;
    NSInteger j = mid+1;
    for (NSInteger k = lo; k <= hi; k++) {
        id tmpi = [tmp objectAtIndex:i];
        id tmpj = [tmp objectAtIndex:j];
        if (i > mid) {
            [self replaceObjectAtIndex:k withObject:tmpj];
            j++;
        } else if (j > hi) {
            [self replaceObjectAtIndex:k withObject:tmpi];
            i++;
        } else if ([tmpi compare:tmpj] == NSOrderedAscending) {
            [self replaceObjectAtIndex:k withObject:tmpi];
            i++;
        } else {
            [self replaceObjectAtIndex:k withObject:tmpj];
            j++;
        }
    }
}

- (void)mergeSort {
    [self mergeSortFromLo:0 toHi:([self count] - 1)];
}

- (void)mergeSortFromLo:(NSInteger)lo toHi:(NSInteger)hi {
    if (lo >= hi) {
        return;
    }
    NSInteger mid = lo + (hi - lo)/2;
    [self mergeSortFromLo:lo toHi:mid];
    [self mergeSortFromLo:mid+1 toHi:hi];
    [self mergeFromLo:lo toHi:hi];
}


@end

@implementation NSMutableArray (QuickSort)

- (void)quickSortFromLo:(NSInteger)lo toHi:(NSInteger)hi {
    if (lo >= hi) {
        return;
    }
    NSInteger partion = [self partitionFromLo:lo toHi:hi];
    [self quickSortFromLo:lo toHi:partion-1];
    [self quickSortFromLo:partion+1 toHi:hi];
}

- (void)quickSort {
    [self quickSortFromLo:0 toHi:[self count]-1];
}

- (NSInteger)partitionFromLo:(NSInteger)lo toHi:(NSInteger)hi {
    NSInteger i = lo;
    NSInteger j = hi + 1;
    id pivot = [self objectAtIndex:lo];
    while (true) {
        while ([pivot compare:[self objectAtIndex:(++i)]] == NSOrderedDescending) {
            if (i == hi) {
                break;
            }
        }
        while ([pivot compare:[self objectAtIndex:(--j)]] == NSOrderedAscending) {
            if (j == lo) {
                break;
            }
        }
        if (i >= j) {
            break;
        } else {
            [self swap:i with:j];
        }
        [self swap:lo with:j];
    }
    return j;
}

@end
