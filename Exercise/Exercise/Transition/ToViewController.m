//
//  ToViewController.m
//  Exercise
//
//  Created by 陈天宇 on 16/7/22.
//  Copyright © 2016年 Angry_Rookie. All rights reserved.
//

#import "ToViewController.h"
#import "PopTransition.h"

@interface ToViewController ()<UINavigationControllerDelegate>

@end

@implementation ToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.delegate = self;
}

- (IBAction)popBtnOnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        return [[PopTransition alloc] init];
    } else {
        return nil;
    }
}

@end
