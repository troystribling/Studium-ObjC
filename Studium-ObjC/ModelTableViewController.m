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

- (NSArray<Book*>*)booksForAuthor:(Author*)author;

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
    _authors = [self.managedObjectContext executeFetchRequest:request error:nil];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray<Book*>*)booksForAuthor:(Author *)author {
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Book"];
    request.predicate = [NSPredicate predicateWithFormat:@"author = %@", author];
    return [self.managedObjectContext executeFetchRequest:request error:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.authors count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Author* author = [self.authors objectAtIndex:section];
    return [[self booksForAuthor:author] count];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    Author* author = [self.authors objectAtIndex:section];
    return author.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CoreData" forIndexPath:indexPath];
    Author* author = [self.authors objectAtIndex:indexPath.section];
    NSArray<Book*>* books = [self booksForAuthor:author];
    Book* book = [books objectAtIndex:indexPath.row];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [book.rating stringValue];
    return cell;
}

@end
