//
//  BitManipulation.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/26/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BitManipulation : NSObject

+ (NSString*)bitsToString:(long)val;
+ (long)flipBits:(long)val;
+ (BOOL)isPowerOf2:(unsigned long)val;
+ (unsigned long)andFrom:(unsigned long)start To:(unsigned long)end;
+ (unsigned long)xorArray:(unsigned long[])array ofLength:(int)n;
+ (long)twosComplement:(long)val;

@end
