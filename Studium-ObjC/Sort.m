//
//  Sort.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/18/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "Sort.h"

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
