//
//  ViewController.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/10/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    self.view.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.view.layer.cornerRadius = 40.0;
    self.view.layer.frame = CGRectInset(self.view.frame, 40.0, 40.0);
    [self addNewLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addNewLayer {
    CALayer* newLayer = [CALayer layer];
    newLayer.backgroundColor = [UIColor blueColor].CGColor;
    newLayer.shadowOffset = CGSizeMake(0.0, 3.0);
    newLayer.shadowRadius = 5.0;
    newLayer.shadowColor = [UIColor blackColor].CGColor;
    newLayer.shadowOpacity = 0.8;
    newLayer.borderColor = [UIColor blackColor].CGColor;
    newLayer.borderWidth = 5.0;
    CGSize vsize = self.view.frame.size;
    newLayer.frame = CGRectMake((vsize.width - 200.0)/2.0, (vsize.height - 200)/2.0, 200.0, 200.0);
    [self.view.layer addSublayer:newLayer];
}


@end
