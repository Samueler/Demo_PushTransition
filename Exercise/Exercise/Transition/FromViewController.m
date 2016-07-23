//
//  FromViewController.m
//  Exercise
//
//  Created by 陈天宇 on 16/7/22.
//  Copyright © 2016年 Angry_Rookie. All rights reserved.
//

#import "FromViewController.h"
#import "PushTransition.h"

@interface FromViewController ()<UINavigationControllerDelegate>

@end

@implementation FromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        PushTransition *pushTransition = [[PushTransition alloc] init];
        return pushTransition;
    } else {
        return nil;
    }
}

@end
