//
//  KVOTableViewController.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/14/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "KVOTableViewController.h"
#import "UIViewViewController.h"

@interface KVOTableViewController ()

@property(nonatomic, retain) NSMutableArray<NSNumber*>* notifiedValues;

@end

@implementation KVOTableViewController

- (id)initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _notifiedValues = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.controller addObserver:self
                      forKeyPath:@"count"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
}

- (void)dealloc {
    [self.controller removeObserver:self forKeyPath:@"count"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void*)context {
    NSNumber* newNumber = (NSNumber*)[change objectForKey:@"new"];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KVOCell" forIndexPath:indexPath];
    NSNumber* value = [self.notifiedValues objectAtIndex:indexPath.row];
    cell.textLabel.text = [value stringValue];
    return cell;
}


@end
