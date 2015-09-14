//
//  Author+CoreDataProperties.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/13/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Author.h"
#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Author (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Book *> *books;

@end

@interface Author (CoreDataGeneratedAccessors)

- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSSet<Book *> *)values;
- (void)removeBooks:(NSSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END
