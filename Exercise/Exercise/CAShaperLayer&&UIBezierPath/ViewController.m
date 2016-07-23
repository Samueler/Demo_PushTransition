//
//  ViewController.m
//  Exercise
//
//  Created by 陈天宇 on 16/7/23.
//  Copyright © 2016年 Angry_Rookie. All rights reserved.
//

#import "ViewController.h"
#import "Exercise.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAShapeLayer *shapeLayer = [Exercise exercise];
    [self.view.layer addSublayer:shapeLayer];
}

@end
