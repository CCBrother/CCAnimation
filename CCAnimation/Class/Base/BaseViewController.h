//
//  BaseViewController.h
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BasicType){
    BasicTypePosition = 0,
    BasicTypeOpacity,
    BasicTypeScale,
    BasicTypeRotate,
    BasicTypeBackground
};

typedef NS_ENUM(NSInteger, KeyType){
    KeyTypeKeyFrame = 0,
    KeyTypePath,
    KeyTypeShake
};

typedef NS_ENUM(NSInteger, GroupType){
    GroupTypeSameTime = 0,
    GroupTypeContinue
};

typedef NS_ENUM(NSInteger, TransitionType){
    TransitionTypeFade = 0,
    TransitionTypeMoveIn,
    TransitionTypePush,
    TransitionTypeReveal,
    TransitionTypeCube,
    TransitionTypeSuck,
    TransitionTypeOglFile,
    TransitionTypeRipple,
    TransitionTypeCurl,
    TransitionTypeUnCurl,
    TransitionTypeCaOpen,
    TransitionTypeCaClose
};

@interface BaseViewController : UIViewController

@property(nonatomic,strong) UIView *bgView;

@end
