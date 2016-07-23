//
//  Exercise.m
//  Exercise
//
//  Created by 陈天宇 on 16/7/23.
//  Copyright © 2016年 Angry_Rookie. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

+ (CAShapeLayer *)exercise {
    // 创建bezierPath
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    /**
     *  设置path的起点为（200, 100）
     */
    [bezierPath moveToPoint:CGPointMake(200, 100)];
    
    /**
     *  绘制一个半径为50的圆
     *
     *  @param addArcWithCenter 圆点坐标
     *  @param radius 圆的半径
     *  @param startAngle 开始绘图的弧度
     *  @param endAngle 结束绘图的弧度
     *  @param clockwise 是否是顺时针
     */
    [bezierPath addArcWithCenter:CGPointMake(150, 100) radius:50.f startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    // 设置起始点
    [bezierPath moveToPoint:CGPointMake(150, 150)];
    // 绘制一条长度为130的直线
    [bezierPath addLineToPoint:CGPointMake(150, 280)];
    // 绘制火柴人的左腿 如果不手动设置起始点，会默认上一次绘画的终点为下一次绘画的起点故而因此此处不设置起始点
    [bezierPath addLineToPoint:CGPointMake(100, 350)];
    // 绘制火柴人的右腿 因为此时的起始点为上一次的终点即(100,350),所以此时需要指定起始点
    [bezierPath moveToPoint:CGPointMake(150, 280)];
    [bezierPath addLineToPoint:CGPointMake(200, 350)];
    // 最后绘制火柴人的手臂
    [bezierPath moveToPoint:CGPointMake(100, 180)];
    [bezierPath addLineToPoint:CGPointMake(200, 180)];
    
    // 创建shapeLayer图层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    // 指定shapeLayer的path
    shapeLayer.path = bezierPath.CGPath;
    // 设置图层绘画的线宽
    shapeLayer.lineWidth = 5.0f;
    // 设置图层画笔的颜色
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    // 设置图层的填充色
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    return shapeLayer;
}

@end
