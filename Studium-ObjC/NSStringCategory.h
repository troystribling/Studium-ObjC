//
//  NSStringCategory.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/17/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringMatch)

- (NSInteger)match:(NSString*)__pattern;
- (BOOL)hasSubString:(NSString*)__otherString;
- (NSString*)deleteRepetitions;

@end

@interface Pangram : NSObject

+ (BOOL)isPangran:(NSArray<NSString*>*)sentence;

@end
