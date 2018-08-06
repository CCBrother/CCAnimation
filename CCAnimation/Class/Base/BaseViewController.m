//
//  BaseViewController.m
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100)/2, SCREEN_HEIGHT/2 - 100, 100, 100)];
    _bgView.backgroundColor = [UIColor colorWithHexString:@"FF6BA0"];
//    _bgView.layer.cornerRadius = 1.0f;
//    _bgView.layer.masksToBounds = YES;
    [self.view addSubview:_bgView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((SCREEN_WIDTH - 80)/2, SCREEN_HEIGHT - 150, 80, 40);
    btn.backgroundColor = [UIColor colorWithHexString:@"30acff"];
    btn.layer.cornerRadius = 8.0;
    btn.layer.masksToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:20.0f];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[self imageWithColor:[UIColor colorWithHexString:@"128ee1"]] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick:(UIButton *)sender {
    
}

- (UIImage *)imageWithColor:(UIColor *)color {
    NSParameterAssert(color != nil);
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
