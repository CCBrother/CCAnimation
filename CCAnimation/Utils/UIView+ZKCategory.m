//
//  UIView+ZKCategory.m
//  ReadReport
//
//  Created by ZhangCc on 2017/11/22.
//  Copyright © 2017年 Zomcom. All rights reserved.
//

#import "UIView+ZKCategory.h"

@implementation UIView (ZKCategory)

- (void)setZK_x:(CGFloat)ZK_x {
    CGRect frame = self.frame;
    frame.origin.x = ZK_x;
    self.frame = frame;
}

- (CGFloat)ZK_x {
    return self.frame.origin.x;;
}

- (void)setZK_y:(CGFloat)ZK_y {
    CGRect frame = self.frame;
    frame.origin.x = ZK_y;
    self.frame = frame;
}

- (CGFloat)ZK_y {
     return self.frame.origin.y;
}

- (void)setZK_width:(CGFloat)ZK_width {
    CGRect frame = self.frame;
    frame.size.width = ZK_width;
    self.frame = frame;
}

- (CGFloat)ZK_width {
    return self.frame.size.width;
}

- (void)setZK_height:(CGFloat)ZK_height {
    CGRect frame = self.frame;
    frame.size.height = ZK_height;
    self.frame = frame;
}

- (CGFloat)ZK_height {
    return self.frame.size.height;
}

- (void)setZK_size:(CGSize)ZK_size {
    CGRect frame = self.frame;
    frame.size = ZK_size;
    self.frame = frame;
}

- (CGSize)ZK_size {
    return self.frame.size;
}

- (void)setZK_origin:(CGPoint)ZK_origin {
    CGRect frame = self.frame;
    frame.origin = ZK_origin;
    self.frame = frame;
}

- (CGPoint)ZK_origin {
    return self.frame.origin;
}

- (void)setZK_centerX:(CGFloat)ZK_centerX {
    CGPoint center = self.center;
    center.x = ZK_centerX;
    self.center = center;
}

- (CGFloat)ZK_centerX {
    return self.center.x;
}

-(void)setZK_centerY:(CGFloat)ZK_centerY {
    CGPoint center = self.center;
    center.x = ZK_centerY;
    self.center = center;
}

- (CGFloat)ZK_centerY {
    return self.center.y;
}


@end
