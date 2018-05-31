//
//  Define.h
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/30.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds

#define GET_IMAGE(imageName)       [UIImage imageNamed:imageName]

#define POSITION                    @"position"                             //位移
#define OPACITY                     @"opacity"                              //透明度
#define TRANSFORM_SCALE             @"transform.scale"                      //缩放
#define TRANSFORM_ROTATION_Z        @"transform.rotation.z"                 //旋转
#define BACKGROUNDCOLOR             @"backgroundColor"                      //背景色
#define TRANSFORM_ROTATION          @"transform.rotation"                   //抖动

#endif /* Define_h */
