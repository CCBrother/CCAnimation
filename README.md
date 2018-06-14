# CCAnimation
1、基本动画：位移、透明度、缩放、旋转、背景色  
2、关键帧动画：关键帧、路径、抖动  
3、过渡动画：同时、连续  
4、组动画：Fade(渐变)、MoveIn(侧滑)、Push(推开)、Reveal(揭开)、Cube(立方旋转)、Suck(飘窗)、OglFile(翻片)、Ripple(涟漪)、Curl(撕开)、UnCurl(贴上)、CaOpen(相机镜头开放)、CaClose(相机镜头关闭)  
5、组合动画等：添加、钉钉、点赞、贝塞尔曲线、进度条

##  效果图
![gif_0](https://github.com/CCBrother/CCAnimation/blob/master/CCAnimation/ShowImages/all.gif)
![gif_1](https://github.com/CCBrother/CCAnimation/blob/master/CCAnimation/ShowImages/basic.gif)
![gif_2](https://github.com/CCBrother/CCAnimation/blob/master/CCAnimation/ShowImages/key.gif)
![gif_3](https://github.com/CCBrother/CCAnimation/blob/master/CCAnimation/ShowImages/group.gif)
![gif_4](https://github.com/CCBrother/CCAnimation/blob/master/CCAnimation/ShowImages/transition.gif)
![gif_5](https://github.com/CCBrother/CCAnimation/blob/master/CCAnimation/ShowImages/combination.gif)


## 使用
#### 基础动画
``` 
//旋转
- (void)rotateAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:TRANSFORM_ROTATION_Z];
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    animation.duration = 1.0f;
    [self.bgView.layer addAnimation:animation forKey:@"rotateAnimation"];
} 
```

#### 关键帧动画
```
//抖动
- (void)shakeAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM_ROTATION];
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    animation.values = @[value1, value2, value3];
    animation.repeatCount = MAXFLOAT;
    [self.bgView.layer addAnimation:animation forKey:@"shakeAnimation"];
} 
```

#### 组动画
```
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
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.8f];
    scaleAnimation.toValue = [NSNumber numberWithFloat:2.0f];
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:TRANSFORM_ROTATION];
    rotateAnimation.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[keyAnimation,scaleAnimation,rotateAnimation];
    groupAnimation.duration = 3.0f;
    [self.bgView.layer addAnimation:groupAnimation forKey:@"sameTimeAnimation"];
}
```

#### 过渡动画
```
//涟漪
- (void)ripple {    
    CATransition *transition = [CATransition animation];
    transition.type = @"rippleEffect";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0f;
    [self.bgView.layer addAnimation:transition forKey:@"rippleAnimation"];
}
```

#### 组合动画
```
//进度条
- (void)progressAnimation {
    self.progressView.timeInterval = 0.5f;
    //弧线
    [_progressView drawArcWithStartAngle:-M_PI * 5 / 4 endAngle:M_PI/4 lineWidth:10.0f fillColor:[UIColor clearColor] strokeColor:[UIColor lightGrayColor]];
    // 计时器
    _progressView.speedValue = 180.8f;
    [NSTimer scheduledTimerWithTimeInterval:_progressView.timeInterval target:_progressView selector:@selector(runSpeedProgress) userInfo:nil repeats:NO];
    //刻度
    [_progressView drawScaleWithDivide:50 andRemainder:5 strokeColor:[UIColor blackColor] filleColor:[UIColor clearColor] scaleLineNormalWidth:5 scaleLineBigWidth:10];
    // 增加刻度值
    [_progressView DrawScaleValueWithDivide:10];
    // 进度的曲线
    [_progressView drawProgressCicrleWithfillColor:[UIColor clearColor] strokeColor:[UIColor whiteColor]];
    [_progressView setColorGrad:[NSArray arrayWithObjects:(id)[[UIColor colorWithRed:2.0/255 green:186.0/255 blue:197.0/255 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:44.0/255 green:203.0/255 blue:112.0/255 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:254.0/255 green:136.0/255 blue:5.0/255 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:247.0/255 green:21.0/255 blue:47.0/255 alpha:1.0] CGColor],nil]];
}
```
