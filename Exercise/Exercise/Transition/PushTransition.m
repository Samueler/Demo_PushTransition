//
//  PushTransition.m
//  Exercise
//
//  Created by 陈天宇 on 16/7/22.
//  Copyright © 2016年 Angry_Rookie. All rights reserved.
//

#import "PushTransition.h"
#import "FromViewController.h"
#import "ToViewController.h"

@implementation PushTransition {
    id<UIViewControllerContextTransitioning> _transitionContext;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    _transitionContext = transitionContext;
    FromViewController *fromVC = (FromViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ToViewController *toVC = (ToViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *contentView = [transitionContext containerView];
    
    [contentView addSubview:fromVC.view];
    [contentView addSubview:toVC.view];
    
    UIButton *pushBtn = fromVC.pushBtn;
    CGPoint startPoint = pushBtn.center;
    
    CGPoint finalPoint = CGPointMake(0, [UIScreen mainScreen].bounds.size.height);
    
    UIBezierPath *maskLayerStartPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(pushBtn.center.x, pushBtn.center.y, 0, 0)];
    double radius = sqrt(pow(startPoint.x, 2) + pow((finalPoint.y - startPoint.y), 2));
    UIBezierPath *maskLayerFinalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(pushBtn.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskLayerFinalPath.CGPath;
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.delegate = self;
    
    maskLayerAnimation.fromValue = (__bridge id)(maskLayerStartPath.CGPath);
    maskLayerAnimation.toValue = (__bridge id)(maskLayerFinalPath.CGPath);
    maskLayerAnimation.duration = 1.0f;
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"pushPath"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [_transitionContext completeTransition:![_transitionContext transitionWasCancelled]];
    [_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}

@end
