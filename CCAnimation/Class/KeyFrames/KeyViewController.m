//
//  KeyViewController.m
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "KeyViewController.h"

@interface KeyViewController ()

@property (nonatomic, assign) KeyType type;

@end

@implementation KeyViewController

- (instancetype)initWithType:(KeyType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"关键帧", @"路径", @"抖动"];
    self.navigationItem.title = array[self.type];
}

- (void)btnClick:(UIButton *)sender {
    switch (self.type) {
        case KeyTypeKeyFrame:
            [self keyFrameAnimation];
            break;
        case KeyTypePath:
            [self pathAnimation];
            break;
        case KeyTypeShake:
            [self shakeAnimation];
            break;
        default:
            break;
    }
}

//关键帧
- (void)keyFrameAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:POSITION];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 64)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/3 + 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3 + 100, SCREEN_HEIGHT/3)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH - 50, SCREEN_HEIGHT/3 + 200)];
    animation.values = @[value1, value2, value3, value4];
    animation.duration = 1.0f;
    [self.bgView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}

//路径
- (void)pathAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:POSITION];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2) radius:60.0f startAngle:0.0f endAngle:M_PI * 2 clockwise:YES];
    animation.duration = 2.0f;
    animation.path = path.CGPath;
    [self.bgView.layer addAnimation:animation forKey:@"pathAnimation"];
}

//抖动
- (void)shakeAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM_ROTATION];
    NSValue *value1 = @(- M_PI/180*4);
    NSValue *value2 = @(M_PI/180*4);;
    NSValue *value3 = @(- M_PI/180*4);
    animation.values = @[value1, value2, value3];
    animation.repeatCount = MAXFLOAT;
    [self.bgView.layer addAnimation:animation forKey:@"shakeAnimation"];
}


@end
