//
//  UIView+HLExtension.m
//  HLRefreshView
//
//  Created by String on 14/12/27.
//  Copyright (c) 2014年 ___string___. All rights reserved.
//

#import "UIView+HLExtension.h"

@implementation UIView (HLExtension)

- (void)setHL_x:(CGFloat)HL_x
{
    CGRect frame = self.frame;
    frame.origin.x = HL_x;
    self.frame = frame;
}

- (CGFloat)HL_x
{
    return self.frame.origin.x;
}

- (void)setHL_y:(CGFloat)HL_y
{
    CGRect frame = self.frame;
    frame.origin.y = HL_y;
    self.frame = frame;
}

- (CGFloat)HL_y
{
    return self.frame.origin.y;
}

- (void)setHL_width:(CGFloat)HL_width
{
    CGRect frame = self.frame;
    frame.size.width = HL_width;
    self.frame = frame;
}

- (CGFloat)HL_width
{
    return self.frame.size.width;
}

- (void)setHL_height:(CGFloat)HL_height
{
    CGRect frame = self.frame;
    frame.size.height = HL_height;
    self.frame = frame;
}

- (CGFloat)HL_height
{
    return self.frame.size.height;
}

- (void)setHL_size:(CGSize)HL_size
{
    CGRect frame = self.frame;
    frame.size = HL_size;
    self.frame = frame;
}

- (CGSize)HL_size
{
    return self.frame.size;
}

- (void)setHL_origin:(CGPoint)HL_origin
{
    CGRect frame = self.frame;
    frame.origin = HL_origin;
    self.frame = frame;
}

- (CGPoint)HL_origin
{
    return self.frame.origin;
}


@end
