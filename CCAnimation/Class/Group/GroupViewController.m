//
//  GroupViewController.m
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "GroupViewController.h"

@interface GroupViewController ()

@property (nonatomic, assign) GroupType type;

@end

@implementation GroupViewController

- (instancetype)initWithType:(GroupType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"同时", @"连续"];
    self.navigationItem.title = array[self.type];
}

- (void)btnClick:(UIButton *)sender {
    switch (self.type) {
        case GroupTypeSameTime:
            [self sameTimeAnimation];
            break;
        case GroupTypeContinue:
            [self continueAnimation];
            break;
        default:
            break;
    }
}

//同时
- (void)sameTimeAnimation {
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:POSITION];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-50, SCREEN_HEIGHT/2-50)];
    keyAnimation.values = @[value1, value2, value3, value4, value5, value6];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:TRANSFORM_SCALE];
    scaleAnimation.fromValue = @(0.8f);
    scaleAnimation.toValue = @(2.0f);
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:TRANSFORM_ROTATION];
    rotateAnimation.toValue = @(M_PI*4);
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[keyAnimation,scaleAnimation,rotateAnimation];
    groupAnimation.duration = 3.0f;
    [self.bgView.layer addAnimation:groupAnimation forKey:@"sameTimeAnimation"];
}

//连续
- (void)continueAnimation {
    //连续动画要处理好时间的衔接
    //开始的时间
    CFTimeInterval currentTime = CACurrentMediaTime();
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:POSITION];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2)];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    positionAnimation.duration = 1.0f;
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    positionAnimation.beginTime = currentTime;
    [self.bgView.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:TRANSFORM_SCALE];
    scaleAnimation.fromValue = @(0.8f);
    scaleAnimation.toValue = @(2.0f);
    scaleAnimation.duration = 1.0f;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.beginTime = currentTime + 1.0f;
    [self.bgView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:TRANSFORM_ROTATION];
    rotateAnimation.toValue = @(M_PI * 4);
    rotateAnimation.duration = 1.0f;
    rotateAnimation.fillMode  = kCAFillModeForwards;
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.beginTime = currentTime + 2.0f;
    [self.bgView.layer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
    
    CABasicAnimation *shrinkAnimation = [CABasicAnimation animationWithKeyPath:TRANSFORM_SCALE];
    shrinkAnimation.toValue = @(1.0f);
    shrinkAnimation.duration = 1.0f;
    shrinkAnimation.fillMode = kCAFillModeForwards;
    shrinkAnimation.removedOnCompletion = NO;
    shrinkAnimation.beginTime = currentTime + 3.0f;
    [self.bgView.layer addAnimation:shrinkAnimation forKey:@"shrinkAnimation"];
}

@end
