//
//  Sort.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/18/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (MergeSort)

- (void)mergeFromLo:(NSInteger)lo toHi:(NSInteger)hi;
- (void)mergeSort;

@end
