//
//  UIViewViewController.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/13/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "UIViewViewController.h"
#import "KVOTableViewController.h"

@interface UIViewViewController ()

@property(nonatomic, retain) IBOutlet UIImageView* imageView;

- (void)sendNotification;

@end

@implementation UIViewViewController

- (id)initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _count = [NSNumber numberWithInt:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView animateWithDuration:2.0 animations:^{
        self.imageView.alpha = 0.0;
    }];
    [self sendNotification];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    KVOTableViewController* controller = (KVOTableViewController*)segue.destinationViewController;
    controller.controller = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)sendNotification {
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationExample" object:self.count];
        [self setCount:[NSNumber numberWithInt:([self.count intValue] + 1)]];
        [self sendNotification];
    });
}

@end
