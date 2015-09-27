//
//  BitManipulation.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/26/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "BitManipulation.h"

@interface BitManipulation ()

@end

@implementation BitManipulation

+ (NSString*)bitsToString:(long)val {
    NSMutableString* bits = [NSMutableString string];
    long bitCount = 8*sizeof(val);
    for (long i=bitCount-1; i >= 0; i--) {
        [bits appendFormat:@"%@", val & ((long)1 << i) ? @"1" : @"0"];
        if (i % 4 == 0) {
            [bits appendString:@" "];
        }
    }
    return bits;
}

+ (long)flipBits:(long)val {
    return ~val;
}

+ (BOOL)isPowerOf2:(unsigned long)val {
    unsigned long bytes = 8*sizeof(val);
    for (unsigned long i = 0; i < bytes; i++) {
        if (val == ((unsigned long)1 << i)) {
            return YES;
        }
    }
    return NO;
}

+ (unsigned long)andFrom:(unsigned long)start To:(unsigned long)end {
    unsigned long result = start;
    for (unsigned long i = start + 1; i <= end; i++) {
        result &= i;
    }
    return result;
}

+ (unsigned long)xorArray:(unsigned long[])numbers ofLength:(int)n {
    NSLog(@"xor");
    if (n == 1) {
        NSLog(@"numbers[0]=%ld", numbers[0]);
        return numbers[0];
    }
    unsigned long result = numbers[0];
    NSLog(@"numbers[0]=%ld, result=%ld", numbers[0], result);
    for (int i = 1; i < n; i++) {
        result ^= numbers[i];
        NSLog(@"numbers[%d]=%ld, result=%ld", i, numbers[i], result);
    }
    unsigned long result0 =  [self xorArray:&numbers[0] ofLength:n-1];
    unsigned long result1 =  [self xorArray:&numbers[1] ofLength:n-1];
    NSLog(@"n=%d, result=%ld, result0=%ld, result1=%ld", n, result, result0, result1);
    return result ^ result0 ^ result1;
}

+ (long)twosComplement:(long)val {
    return ~val+1;
}

@end
