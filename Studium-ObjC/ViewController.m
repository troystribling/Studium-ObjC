//
//  ViewController.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/10/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, retain) CALayer* subLayer;

- (void)addLayers;
- (void)rotateImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    self.view.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.view.layer.cornerRadius = 40.0;
    self.view.layer.frame = CGRectInset(self.view.frame, 40.0, 80.0);
    [self addLayers];
    [self rotateImage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addLayers {
    _subLayer = [CALayer layer];
    self.subLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.subLayer.shadowOffset = CGSizeMake(0.0, 3.0);
    self.subLayer.shadowRadius = 5.0;
    self.subLayer.shadowColor = [UIColor blackColor].CGColor;
    self.subLayer.shadowOpacity = 0.8;
    self.subLayer.borderColor = [UIColor blackColor].CGColor;
    self.subLayer.borderWidth = 5.0;
    self.subLayer.cornerRadius = 20.0;
    CGSize vsize = self.view.frame.size;
    self.subLayer.frame = CGRectMake((vsize.width - 200.0)/2.0, (vsize.height - 200)/2.0, 200.0, 200.0);
    [self.view.layer addSublayer:self.subLayer];
    
    CALayer* imageLayer = [CALayer layer];
    imageLayer.frame = self.subLayer.bounds;
    imageLayer.contents = (id)[UIImage imageNamed:@"MarsMission"].CGImage;
    imageLayer.masksToBounds = YES;
    imageLayer.cornerRadius = 20.0;
    [self.subLayer addSublayer:imageLayer];
}

- (void)rotateImage {
    CABasicAnimation* rotate = [CABasicAnimation animation];
    rotate.keyPath = @"transform.rotation.z";
    rotate.fromValue = @0;
    rotate.toValue = @(M_2_PI);
    rotate.duration = 15.0;
    [self.subLayer addAnimation:rotate forKey:@"rotateImage"];
}

@end
