//
//  ModelTableViewController.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/13/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelTableViewController : UITableViewController

@property(nonatomic, retain) NSManagedObjectContext* managedObjectContext;

@end
