//
//  CombinationViewController.m
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "CombinationViewController.h"
#import "DCPathButton.h"
#import "DWBubbleMenuButton.h"
#import "MCFireworksButton.h"
#import "LJInstrumentView.h"

@interface CombinationViewController () <DCPathButtonDelegate>

@property (nonatomic, assign) CombinationAniType type;

@property (strong,nonatomic)LJInstrumentView *progressView;

@end

@implementation CombinationViewController

- (instancetype)initWithType:(CombinationAniType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array = @[@"添加",@"钉钉",@"点赞",@"贝塞尔曲线",@"进度条"];
    self.navigationItem.title = array[self.type];
    
    [self animationWithType:self.type];
}

- (void)animationWithType:(CombinationAniType)type {
    switch (type) {
        case CombinationAniTypeAdd:
            [self addAnimation];
            break;
        case CombinationAniTypeDingDing:
            [self dingdingAnimation];
            break;
        case CombinationAniTypeDianZan:
            [self dianzanAnimation];
            break;
        case CombinationAniTypeBezier:
            [self bezierPathAnimation];
            break;
        case 4:
            [self progressAnimation];
            break;
        default:
            break;
    }
}

//添加
- (void)addAnimation {
    // Configure center button
    DCPathButton *dcPathBtn = [[DCPathButton alloc]initWithCenterImage:GET_IMAGE(@"chooser-button-tab")
                                                           hilightedImage:GET_IMAGE(@"chooser-button-tab-highlighted")];
    dcPathBtn.delegate = self;
    
    // Configure item buttons
    DCPathItemButton *itemBtn1 = [[DCPathItemButton alloc]initWithImage:GET_IMAGE(@"chooser-moment-icon-music")
                                                           highlightedImage:GET_IMAGE(@"chooser-moment-icon-music-highlighted")
                                                            backgroundImage:GET_IMAGE(@"chooser-moment-button")
                                                 backgroundHighlightedImage:GET_IMAGE(@"chooser-moment-button-highlighted")];
    
    DCPathItemButton *itemBtn2 = [[DCPathItemButton alloc]initWithImage:GET_IMAGE(@"chooser-moment-icon-place")
                                                           highlightedImage:GET_IMAGE(@"chooser-moment-icon-place-highlighted")
                                                            backgroundImage:GET_IMAGE(@"chooser-moment-button")
                                                 backgroundHighlightedImage:GET_IMAGE(@"chooser-moment-button-highlighted")];
    
    DCPathItemButton *itemBtn3 = [[DCPathItemButton alloc]initWithImage:GET_IMAGE(@"chooser-moment-icon-camera")
                                                           highlightedImage:GET_IMAGE(@"chooser-moment-icon-camera-highlighted")
                                                            backgroundImage:GET_IMAGE(@"chooser-moment-button")
                                                 backgroundHighlightedImage:GET_IMAGE(@"chooser-moment-button-highlighted")];
    
    DCPathItemButton *itemBtn4 = [[DCPathItemButton alloc]initWithImage:GET_IMAGE(@"chooser-moment-icon-thought")
                                                           highlightedImage:GET_IMAGE(@"chooser-moment-icon-thought-highlighted")
                                                            backgroundImage:GET_IMAGE(@"chooser-moment-button")
                                                 backgroundHighlightedImage:GET_IMAGE(@"chooser-moment-button-highlighted")];
    
    DCPathItemButton *itemBtn5 = [[DCPathItemButton alloc]initWithImage:GET_IMAGE(@"chooser-moment-icon-sleep")
                                                           highlightedImage:GET_IMAGE(@"chooser-moment-icon-sleep-highlighted")
                                                            backgroundImage:GET_IMAGE(@"chooser-moment-button")
                                                 backgroundHighlightedImage:GET_IMAGE(@"chooser-moment-button-highlighted")];
    [dcPathBtn addPathItems:@[itemBtn1, itemBtn2, itemBtn3, itemBtn4, itemBtn5]];
    [self.view addSubview:dcPathBtn];
}

//钉钉
- (void)dingdingAnimation {
    UILabel *homeLabel = [self createHomeButtonView];
    
    CGFloat upMenuViewX = SCREEN_WIDTH - homeLabel.CC_width - 20.f;
    CGFloat upMenuViewY = SCREEN_HEIGHT - homeLabel.CC_height - 20.f;
    DWBubbleMenuButton *upMenuView = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(upMenuViewX,upMenuViewY,homeLabel.CC_width,homeLabel.CC_height) expansionDirection:DirectionUp];
    upMenuView.homeButtonView = homeLabel;
    [upMenuView addButtons:[self createDemoButtonArray]];
    [self.view addSubview:upMenuView];
}

//点赞
- (void)dianzanAnimation {
    MCFireworksButton *btn = [[MCFireworksButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-50, 100, 100)];
    btn.particleImage = [UIImage imageNamed:@"Sparkle"];
    btn.particleScale = 0.05;
    btn.particleScaleRange = 0.02;
    btn.selected = NO;
    [btn setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

//贝塞尔曲线
- (void)bezierPathAnimation {
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 首先设置一个起始点
    CGPoint startPoint = CGPointMake(SCREEN_WIDTH/2, 220);
    // 以起始点为路径的起点
    [path moveToPoint:CGPointMake(SCREEN_WIDTH/2, 220)];
    // 设置一个终点
    CGPoint endPoint = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 300);
    // 设置第一个控制点
    CGPoint controlPoint1 = CGPointMake(100, 120);
    // 设置第二个控制点
    CGPoint controlPoint2 = CGPointMake(0, 280);
    // 添加二次贝塞尔曲线
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    // 设置另一个起始点
    [path moveToPoint:endPoint];
    // 设置第三个控制点
    CGPoint controlPoint3 = CGPointMake(SCREEN_WIDTH, 280);
    // 设置第四个控制点
    CGPoint controlPoint4 = CGPointMake(SCREEN_WIDTH - 100, 120);
    // 添加二次贝塞尔曲线
    [path addCurveToPoint:startPoint controlPoint1:controlPoint3 controlPoint2:controlPoint4];
    // 设置线断面类型
    path.lineCapStyle = kCGLineCapRound;
    // 设置连接类型
    path.lineJoinStyle = kCGLineJoinRound;
    
    CAShapeLayer *animLayer = [CAShapeLayer layer];
    animLayer.path = path.CGPath;
    animLayer.lineWidth = 2.f;
    animLayer.strokeColor = [UIColor redColor].CGColor;
    animLayer.fillColor = [UIColor clearColor].CGColor;
    animLayer.strokeStart = 0;
    animLayer.strokeEnd = 1;
    [self.view.layer addSublayer:animLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0);
    animation.toValue = @(1.f);
    animation.duration = 2.0f;
    animation.removedOnCompletion = NO;
    animation.fillMode  = kCAFillModeForwards;
    [animLayer addAnimation:animation forKey:@"strokeEnd"];
}

//进度条
- (void)progressAnimation {
    
    self.progressView.timeInterval = 0.5f;
    // 弧线
    [_progressView drawArcWithStartAngle:-M_PI * 5 / 4 endAngle:M_PI/4 lineWidth:10.0f fillColor:[UIColor clearColor] strokeColor:[UIColor lightGrayColor]];
    // 计时器
    _progressView.speedValue = 180.8f;
    [NSTimer scheduledTimerWithTimeInterval:_progressView.timeInterval target:_progressView selector:@selector(runSpeedProgress) userInfo:nil repeats:NO];
    // 刻度
    [_progressView drawScaleWithDivide:50 andRemainder:5 strokeColor:[UIColor blackColor] filleColor:[UIColor clearColor] scaleLineNormalWidth:5 scaleLineBigWidth:10];
    // 增加刻度值
    [_progressView DrawScaleValueWithDivide:10];
    // 进度的曲线
    [_progressView drawProgressCicrleWithfillColor:[UIColor clearColor] strokeColor:[UIColor whiteColor]];
    [_progressView setColorGrad:[NSArray arrayWithObjects:(id)[UIColor colorWithHexString:@"02BAC5"].CGColor,(id)[UIColor colorWithHexString:@"2CCB7A"].CGColor,(id)[UIColor colorWithHexString:@"FE8805"].CGColor,(id)[UIColor colorWithHexString:@"F7152F"].CGColor,nil]];
}

#pragma mark - Event respons
- (void)dwBtnClick:(UIButton *)sender {
    NSLog(@"亲爱的，你点击的是: %@", sender.titleLabel.text);
}

- (void)handleBtnClick:(MCFireworksButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected){
        [sender popOutsideWithDuration:0.5];
        [sender setImage:[UIImage imageNamed:@"Like-Blue"] forState:UIControlStateNormal];
        [sender animate];
    }else{
        [sender popInsideWithDuration:0.4];
        [sender setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    }
}

#pragma mark - DCPathButtonDelegate
- (void)itemButtonTappedAtIndex:(NSUInteger)index {
    NSLog(@"亲爱的，你点击的是 %ld",index);
}

#pragma mark - Private
- (UILabel *)createHomeButtonView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    label.text = @"Tap";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = label.frame.size.height / 2.f;
    label.backgroundColor = [UIColor colorWithHexString:@"FF6BA0"];
    label.clipsToBounds = YES;
    return label;
}

- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    int i = 0;
    for (NSString *title in @[@"A", @"B", @"C", @"D", @"E", @"F"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 40, 40);
        button.layer.cornerRadius = button.frame.size.height / 2;
        button.backgroundColor = [UIColor colorWithHexString:@"FF6BA0"];
        button.clipsToBounds = YES;
        button.tag = i++;
        [button addTarget:self action:@selector(dwBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonsMutable addObject:button];
    }
    return [buttonsMutable copy];
}

- (LJInstrumentView *)progressView {
    if (!_progressView) {
        _progressView = [[LJInstrumentView   alloc]initWithFrame:CGRectMake(50, 200,  174, 174)];
        _progressView.CC_centerX = SCREEN_WIDTH/2;
        _progressView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_progressView];
    }
    return _progressView;
}

@end
