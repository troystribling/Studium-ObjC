//
//  ModelTableViewController.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/13/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "ModelTableViewController.h"
#import "AppDelegate.h"
#import "Author.h"
#import "Book.h"

@interface ModelTableViewController ()

@property(nonatomic, retain) NSArray<Author*>* authors;

@end

@implementation ModelTableViewController

- (id)initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _managedObjectContext = [[AppDelegate sharedAppDelegate] managedObjectContext];
    }
    return self;
}

- (void)viewDidLoad {
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Author"];
    NSError* error;
    _authors = [self.managedObjectContext executeFetchRequest:request error:&error];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.authors count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    Author* author = [self.authors objectAtIndex:section];
    return author.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CoreData" forIndexPath:indexPath];
    cell.textLabel.text = @"Troy";
    cell.detailTextLabel.text = @"1";
    return cell;
}

@end
