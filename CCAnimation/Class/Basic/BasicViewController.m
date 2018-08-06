//
//  BasicViewController.m
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@property (nonatomic, assign) BasicType type;

@end

@implementation BasicViewController

- (instancetype)initWithType:(BasicType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
    self.navigationItem.title = array[self.type];
}

- (void)btnClick:(UIButton *)sender {
    switch (self.type) {
        case BasicTypePosition:
            [self positionAnimation];
            break;
        case BasicTypeOpacity:
            [self opacityAnimation];
            break;
        case BasicTypeScale:
            [self scaleAnimation];
            break;
        case BasicTypeRotate:
            [self rotateAnimation];
            break;
        case BasicTypeBackground:
            [self backgroundAnimation];
            break;
        default:
            break;
    }
}

//位移
- (void)positionAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:POSITION];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2 - 75)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH - 50, SCREEN_HEIGHT/2 - 75)];
    animation.duration = 1.0f;
    [self.bgView.layer addAnimation:animation forKey:@"positionAnimation"];
}

//透明度
- (void)opacityAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:OPACITY];
    animation.fromValue = @(1.0);
    animation.toValue = @(0.3);
    animation.duration = 1.0f;
    [self.bgView.layer addAnimation:animation forKey:@"opacityAnimation"];
}

//缩放
- (void)scaleAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:TRANSFORM_SCALE];
    animation.fromValue = @(2.0);
    animation.toValue = @(0.5);
    animation.duration = 2.0f;
    [self.bgView.layer addAnimation:animation forKey:@"scaleAnimation"];
}

//旋转
- (void)rotateAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:TRANSFORM_ROTATION_Z];
    animation.toValue = @(M_PI * 2);
    animation.duration = 1.0f;
    [self.bgView.layer addAnimation:animation forKey:@"rotateAnimation"];
}

//背景色
- (void)backgroundAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:BACKGROUNDCOLOR];
    animation.toValue = (id)[UIColor yellowColor].CGColor;
    animation.duration = 2.0f;
    [self.bgView.layer addAnimation:animation forKey:@"backgroundAnimation"];
}


@end
