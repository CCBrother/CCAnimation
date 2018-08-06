//
//  UIView+CCCategory.m
//  ReadReport
//
//  Created by ZhangCc on 2017/11/22.
//  Copyright © 2017年 Zomcom. All rights reserved.
//

#import "UIView+CCCategory.h"

@implementation UIView (CCCategory)

- (void)setCC_x:(CGFloat)CC_x {
    CGRect frame = self.frame;
    frame.origin.x = CC_x;
    self.frame = frame;
}

- (CGFloat)CC_x {
    return self.frame.origin.x;;
}

- (void)setCC_y:(CGFloat)CC_y {
    CGRect frame = self.frame;
    frame.origin.x = CC_y;
    self.frame = frame;
}

- (CGFloat)CC_y {
     return self.frame.origin.y;
}

- (void)setCC_width:(CGFloat)CC_width {
    CGRect frame = self.frame;
    frame.size.width = CC_width;
    self.frame = frame;
}

- (CGFloat)CC_width {
    return self.frame.size.width;
}

- (void)setCC_height:(CGFloat)CC_height {
    CGRect frame = self.frame;
    frame.size.height = CC_height;
    self.frame = frame;
}

- (CGFloat)CC_height {
    return self.frame.size.height;
}

- (void)setCC_size:(CGSize)CC_size {
    CGRect frame = self.frame;
    frame.size = CC_size;
    self.frame = frame;
}

- (CGSize)CC_size {
    return self.frame.size;
}

- (void)setCC_origin:(CGPoint)CC_origin {
    CGRect frame = self.frame;
    frame.origin = CC_origin;
    self.frame = frame;
}

- (CGPoint)CC_origin {
    return self.frame.origin;
}

- (void)setCC_centerX:(CGFloat)CC_centerX {
    CGPoint center = self.center;
    center.x = CC_centerX;
    self.center = center;
}

- (CGFloat)CC_centerX {
    return self.center.x;
}

-(void)setCC_centerY:(CGFloat)CC_centerY {
    CGPoint center = self.center;
    center.x = CC_centerY;
    self.center = center;
}

- (CGFloat)CC_centerY {
    return self.center.y;
}


@end
