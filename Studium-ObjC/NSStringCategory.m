//
//  "NSStringCategory.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/17/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "NSStringCategory.h"

@implementation NSString (StringMatch)

- (NSInteger)match:(NSString*)__pattern {
    NSInteger n = [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    NSInteger m = [__pattern lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    const char* cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    const char* pstr = [__pattern cStringUsingEncoding:NSUTF8StringEncoding];
    for (int i = 0; i <= n - m; i++) {
        for (int j = 0; j < m; j++) {
            if (cstr[i+j] != pstr[j]) {
                break;
            } else {
                if (j == m - 1) {
                    return i;
                }
            }
        }
    }
    return n;
}

- (NSInteger)matchKMP:(NSString*)__pattern {
    return 0;
}

@end
