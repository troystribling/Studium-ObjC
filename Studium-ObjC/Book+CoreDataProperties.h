//
//  Book+CoreDataProperties.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/13/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *rating;
@property (nullable, nonatomic, retain) Author *author;

@end

NS_ASSUME_NONNULL_END
