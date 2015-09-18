//
//  BinarySearch.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/16/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "BinarySearch.h"

@interface BinarySearch ()

+ (NSInteger)find:(id)value in:(NSArray *)values start:(NSInteger)start end:(NSInteger)end;

@end

@implementation BinarySearch

+ (NSInteger)find:(id)value in:(NSArray *)values {
    return [self find:value in:values start:0 end:[values count] - 1];
}

+ (NSInteger)find:(id)value in:(NSArray *)values start:(NSInteger)start end:(NSInteger)end {
    if (start > end) {
        return -1;
    }
    NSInteger mid = (end - start)/2 + start;
    NSComparisonResult result = [value compare:[values objectAtIndex:mid]];
    if (result == NSOrderedAscending) {
        return [self find:value in:values start:start end:mid-1];
    } else if (result == NSOrderedDescending) {
        return [self find:value in:values start:mid+1 end:end];
    } else {
        return mid;
    }
}

@end
