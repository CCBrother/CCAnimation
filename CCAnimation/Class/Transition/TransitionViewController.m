//
//  TransitionViewController.m
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@property (nonatomic, assign) TransitionType type;

@property(nonatomic,strong)UILabel *numLabel;

@property(nonatomic,assign)NSInteger index;

@end

@implementation TransitionViewController

- (instancetype)initWithType:(TransitionType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"Fade(渐变)",@"MoveIn(侧滑)",@"Push(推开)",@"Reveal(揭开)",@"Cube(立方旋转)",@"Suck(飘窗)",@"OglFile(翻片)",@"Ripple(涟漪)",@"Curl(撕开)",@"UnCurl(贴上)",@"CaOpen(相机镜头开放)",@"CaClose(相机镜头关闭)"];
    self.navigationItem.title = array[self.type];
    
    [self buildLabel];
}

- (void)buildLabel {
    _index = 0;
    
    _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bgView.frame)/2-12.5, CGRectGetHeight(self.bgView.frame)/2-20, 25, 40)];
    _numLabel.textAlignment = NSTextAlignmentCenter;
    _numLabel.font = [UIFont systemFontOfSize:40.0f];
    _numLabel.textColor = [UIColor whiteColor];
    [self.bgView addSubview:_numLabel];
}

- (void)addNumberToLabel {
    if (_index > 3){
        _index = 0;
    }
    
    NSArray *colors = @[[UIColor colorWithHexString:@"30acff"],[UIColor colorWithHexString:@"e63334"],[UIColor colorWithHexString:@"35ED2D"],[UIColor colorWithHexString:@"FF6BA0"]];
    NSArray *numArray = @[@"1",@"2",@"3",@"4"];
    
    self.bgView.backgroundColor = colors[_index];
    self.numLabel.text = numArray[_index];
    
    _index++;
}

- (void)btnClick:(UIButton *)sender {
    switch (self.type) {
        case TransitionTypeFade:
            [self fade];
            break;
        case TransitionTypeMoveIn:
            [self moveIn];
            break;
        case TransitionTypePush:
            [self push];
            break;
        case TransitionTypeReveal:
            [self reveal];
            break;
        case TransitionTypeCube:
            [self cube];
            break;
        case TransitionTypeSuck:
            [self suck];
            break;
        case TransitionTypeOglFile:
            [self oglFile];
            break;
        case TransitionTypeRipple:
            [self ripple];
            break;
        case TransitionTypeCurl:
            [self curl];
            break;
        case TransitionTypeUnCurl:
            [self unCurl];
            break;
        case TransitionTypeCaOpen:
            [self caOpen];
            break;
        case TransitionTypeCaClose:
            [self caClose];
            break;
        default:
            break;
    }
}

//渐变
- (void)fade {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"fadeAnimation"];
}

//侧滑
- (void)moveIn {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"moveInAnimation"];
}

//推开
- (void)push {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"pushAnimation"];
}

//揭开
- (void)reveal {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"revealAnimation"];
}

//立方旋转
- (void)cube {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"cubeAnimation"];
}

//飘窗
- (void)suck {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"suckEffect";
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"suckAnimation"];
}

//翻片
- (void)oglFile {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"oglFlip";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"oglFileAnimation"];
}

//涟漪
- (void)ripple {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"rippleEffect";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"rippleAnimation"];
}

//撕开
- (void)curl {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"pageCurl";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"curlAnimation"];
}

//贴上
- (void)unCurl {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"pageUnCurl";
    transition.subtype = kCATransitionFromLeft;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"unCurlAnimation"];
}

//相机镜头开放
- (void)caOpen {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"cameraIrisHollowOpen";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"caOpenAnimation"];
}

//相机镜头关闭
- (void)caClose {
    [self addNumberToLabel];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"cameraIrisHollowClose";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"caCloseAnimation"];
}

@end
