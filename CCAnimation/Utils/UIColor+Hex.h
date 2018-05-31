//
//  UIColor+Hex.h
//  ReadReport
//
//  Created by ZhangCc on 2017/10/25.
//  Copyright © 2017年 zomcom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 * 十六进制颜色转换
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  十六进制颜色转换:含alpha
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(float)alpha;

@end
