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
    NSInteger n = self.length;
    NSInteger m = __pattern.length;
    for (NSInteger i = 0; i <= n - m; i++) {
        for (NSInteger j = 0; j < m; j++) {
            unichar str = [self characterAtIndex:i+j];
            unichar pstr = [__pattern characterAtIndex:j];
            if (str != pstr) {
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

- (BOOL)hasSubString:(NSString *)__otherString {
    for (NSInteger i=0; i < self.length; i++) {
        unichar outterStr = [self characterAtIndex:i];
        for (NSInteger j = 0; j < __otherString.length; j++) {
            unichar innerStr = [__otherString characterAtIndex:j];
            if (outterStr == innerStr) {
                return YES;
            }
        }
    }
    return NO;
}

- (NSString*)deleteRepetitions {
    NSMutableString* result = [NSMutableString string];
    NSInteger size = self.length;
    if (size > 0) {
        unichar prev = 0;
        for (NSInteger i=0; i < size; i++) {
            unichar chr = [self characterAtIndex:i];
            if (i > 0) {
                if (chr != prev) {
                    [result appendString:[NSString stringWithCharacters:&chr length:1]];
                }
            } else {
                [result appendString:[NSString stringWithCharacters:&chr length:1]];
            }
            prev = chr;
        }
    }
    return result;
}

@end

@implementation Pangram

+ (BOOL)isPangran:(NSArray<NSString *>*)sentence {
    NSMutableSet* letters = [NSMutableSet set];
    for (NSString* word in sentence) {
        for (NSInteger i=0; i < word.length; i++) {
            unichar letter = [word characterAtIndex:i];
            [letters addObject:[[NSString stringWithCharacters:&letter length:1] lowercaseString]];
        }
    }
    return [letters count] == 26;
}

@end
