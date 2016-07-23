//
//  PopTransition.m
//  Exercise
//
//  Created by 陈天宇 on 16/7/22.
//  Copyright © 2016年 Angry_Rookie. All rights reserved.
//

#import "PopTransition.h"
#import "FromViewController.h"
#import "ToViewController.h"

@implementation PopTransition {
    id<UIViewControllerContextTransitioning> _transitionContext;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    _transitionContext = transitionContext;
    ToViewController *fromVC = (ToViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FromViewController *toVC = (FromViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *contentView = [transitionContext containerView];
    [contentView addSubview:toVC.view];
    [contentView addSubview:fromVC.view];
    
    UIButton *pushBtn = toVC.pushBtn;
    
    CGPoint finalPoint = pushBtn.center;
    CGPoint startPoint = CGPointMake(0, [UIScreen mainScreen].bounds.size.height);
    
    UIBezierPath *maskLayerFinalPath = [UIBezierPath bezierPathWithOvalInRect:pushBtn.frame];
    
    double radius = sqrt((pow(finalPoint.x, 2) + pow(startPoint.y, 2)));
    
    UIBezierPath *maskLayerStartPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(pushBtn.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskLayerFinalPath.CGPath;
    fromVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    maskLayerAnimation.delegate = self;
    
    maskLayerAnimation.fromValue = (__bridge id)(maskLayerStartPath.CGPath);
    maskLayerAnimation.toValue = (__bridge id)(maskLayerFinalPath.CGPath);
    maskLayerAnimation.duration = 1.0f;
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"popPath"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    [_transitionContext completeTransition:![_transitionContext transitionWasCancelled]];
    [_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}



@end
