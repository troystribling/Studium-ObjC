//
//  KVOTableViewController.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/14/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIViewViewController;

@interface KVOTableViewController : UITableViewController

@property(nonatomic, weak) UIViewViewController* controller;

@end
