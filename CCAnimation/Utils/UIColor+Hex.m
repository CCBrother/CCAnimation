//
//  UIColor+Hex.m
//  ReadReport
//
//  Created by ZhangCc on 2017/10/25.
//  Copyright © 2017年 zomcom. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

//十六进制颜色转换
+ (UIColor *)colorWithHexString:(NSString *)hexString  {
    return [self colorWithHexString:hexString alpha:1.0];
}

//十六进制颜色转换+alpha
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(float)alpha {
    NSString *string = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([string length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([string hasPrefix:@"0X"])
        string = [string substringFromIndex:2];
    if ([string hasPrefix:@"#"])
        string = [string substringFromIndex:1];
    if ([string length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [string substringWithRange:range];
    range.location = 2;
    NSString *gString = [string substringWithRange:range];
    range.location = 4;
    NSString *bString = [string substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0];
}

@end
