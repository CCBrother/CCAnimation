//
//  CombinationViewController.h
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

//组合动画

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CombinationAniType){
    CombinationAniTypeAdd = 0,
    CombinationAniTypeDingDing,
    CombinationAniTypeDianZan,
    CombinationAniTypeBezier,
};

@interface CombinationViewController : UIViewController

- (instancetype)initWithType:(CombinationAniType)type;

@end
