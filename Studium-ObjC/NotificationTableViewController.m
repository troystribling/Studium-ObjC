//
//  NotificationTableViewController.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/14/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "NotificationTableViewController.h"

@interface NotificationTableViewController ()

@property(nonatomic, retain) NSMutableArray<NSNumber*>* notifiedValues;

@end

@implementation NotificationTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _notifiedValues = [NSMutableArray array];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receivedNotification:)
                                                     name:@"NotificationExample"
                                                   object:nil];
            
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)receivedNotification:(NSNotification*)note {
    NSNumber* newNumber = (NSNumber*)note.object;
    [self.notifiedValues addObject:newNumber];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notifiedValues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell" forIndexPath:indexPath];
    NSNumber* value = [self.notifiedValues objectAtIndex:indexPath.row];
    cell.textLabel.text = [value stringValue];
    return cell;
}


@end
