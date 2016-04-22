//
//  ZQKTip.m
//  TestPath
//
//  Created by xixi on 16/4/21.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import "ZQKTip.h"


@implementation ZQKTip

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame
                  andLineWidth:3.0
                  andLineColor:@[
                                 [UIColor redColor],
                                 [UIColor greenColor],
                                 [UIColor blueColor]]];
}

- (instancetype)initWithFrame:(CGRect)frame andLineWidth:(CGFloat)lineWidth andLineColor:(NSArray *)lineColor
{
    self = [super initWithFrame:frame];
    if(self) {
        self.lineWidth = lineWidth;
        self.lineColor = lineColor;
        
    }
    
    return self;
}

-(void) show
{
    [self initView];
    
}
-(void) setYes
{
    [self.progressLayer removeAnimationForKey:@"strokeAnim"];
    [self.layer removeAnimationForKey:@"rotationAnimation"];
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.5;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0];
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    UIBezierPath *yesPath = [UIBezierPath bezierPath];
    CGFloat moveX = CGRectGetWidth(self.frame)/5;
    CGFloat moveY = CGRectGetHeight(self.frame)/2;
    [yesPath moveToPoint:CGPointMake(moveX, moveY)];
    
    [yesPath addLineToPoint:CGPointMake(2*(CGRectGetWidth(self.frame)/5) ,4.5 * (CGRectGetHeight(self.frame)/6))];
    [yesPath addLineToPoint:CGPointMake((4*(CGRectGetWidth(self.frame)/5) + 5.0), 2*CGRectGetHeight(self.frame)/6 + 5.0)];
    
    yesPath.lineWidth = 1.5;
    
    
    CAShapeLayer *yesProgressLayer = [CAShapeLayer layer];
    yesProgressLayer.lineWidth = self.lineWidth;
    yesProgressLayer.lineCap = kCALineCapRound;
    yesProgressLayer.strokeColor = [UIColor blueColor].CGColor;
    yesProgressLayer.fillColor = [UIColor clearColor].CGColor;
    yesProgressLayer.path = yesPath.CGPath;
    [yesProgressLayer addAnimation:pathAnimation forKey:nil];
    
    [self.layer addSublayer:yesProgressLayer];
}

-(void) setError
{
    [self.progressLayer removeAnimationForKey:@"strokeAnim"];
    [self.layer removeAnimationForKey:@"rotationAnimation"];
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.5;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0];
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    UIBezierPath *yesPath = [UIBezierPath bezierPath];
    CGFloat moveX = CGRectGetWidth(self.frame)/4;
    CGFloat moveY = CGRectGetHeight(self.frame)/4;
    [yesPath moveToPoint:CGPointMake(moveX, moveY)];
    [yesPath addLineToPoint:CGPointMake(3 *moveX ,3 *moveY)];
    
    [yesPath moveToPoint:CGPointMake(3 * moveX, moveY)];
    [yesPath addLineToPoint:CGPointMake(moveX, 3 * moveY)];
    
    yesPath.lineWidth = 1.5;
    
    
    CAShapeLayer *yesProgressLayer = [CAShapeLayer layer];
    yesProgressLayer.lineWidth = self.lineWidth;
    yesProgressLayer.lineCap = kCALineCapRound;
    yesProgressLayer.strokeColor = [UIColor blueColor].CGColor;
    yesProgressLayer.fillColor = [UIColor clearColor].CGColor;
    yesProgressLayer.path = yesPath.CGPath;
    [yesProgressLayer addAnimation:pathAnimation forKey:nil];
    
    [self.layer addSublayer:yesProgressLayer];
}


- (void)initView
{
    NSAssert(self.lineWidth > 0.0, @"lineWidth must great than zero");
    NSAssert(self.lineColor.count > 0, @"lineColor must set");
    
    //外层旋转动画
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @0.0;
    rotationAnimation.toValue = @(2*M_PI);
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.duration = 3.0;
    rotationAnimation.beginTime = 0.0;
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    //    return;
    //内层进度条动画
    CABasicAnimation *strokeAnim1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnim1.fromValue = @0.0;
    strokeAnim1.toValue = @1.0;
    strokeAnim1.duration = 1.0;
    strokeAnim1.beginTime = 0.0;
    strokeAnim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //内层进度条动画
    CABasicAnimation *strokeAnim2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeAnim2.fromValue = @0.0;
    strokeAnim2.toValue = @1.0;
    strokeAnim2.duration = 1.0;
    strokeAnim2.beginTime = 1.0;
    strokeAnim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.duration = 2.0;
    animGroup.repeatCount = HUGE_VALF;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.animations = @[strokeAnim1, strokeAnim2];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.lineWidth, self.lineWidth, CGRectGetWidth(self.frame)-self.lineWidth*2, CGRectGetHeight(self.frame)-self.lineWidth*2)];
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.lineWidth = self.lineWidth;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.strokeColor = ((UIColor *)self.lineColor[0]).CGColor;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeStart = 0.0;
    self.progressLayer.strokeEnd = 1.0;
    self.progressLayer.path = path.CGPath;
    self.progressLayer.strokeColor = [UIColor blueColor].CGColor;
    [self.progressLayer addAnimation:animGroup forKey:@"strokeAnim"];
    
    [self.layer addSublayer:self.progressLayer];
    
    
    [self performSelector:@selector(stop) withObject:nil afterDelay:5.f];
}

-(void) stop
{
    [self.progressLayer removeAnimationForKey:@"strokeAnim"];
    [self.layer removeAnimationForKey:@"rotationAnimation"];
    
    
    [self setError];
    [self setYes];
}


- (void)randomColor {
    UIColor *color = (UIColor *)[self.lineColor objectAtIndex:arc4random()%self.lineColor.count];
    self.progressLayer.strokeColor = color.CGColor;
}

@end
