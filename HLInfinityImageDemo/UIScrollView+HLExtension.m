//
//  UIScrollView+HLExtension.m
//  HLRefreshView
//
//  Created by String on 14/12/28.
//  Copyright (c) 2014年 ___string___. All rights reserved.
//

#import "UIScrollView+HLExtension.h"

@implementation UIScrollView (HLExtension)

- (void)setHL_contentInsetTop:(CGFloat)HL_contentInsetTop
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = HL_contentInsetTop;
    self.contentInset = inset;
}

- (CGFloat)HL_contentInsetTop
{
    return self.contentInset.top;
}

- (void)setHL_contentInsetBottom:(CGFloat)HL_contentInsetBottom
{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = HL_contentInsetBottom;
    self.contentInset = inset;
}

- (CGFloat)HL_contentInsetBottom
{
    return self.contentInset.bottom;
}

- (void)setHL_contentInsetLeft:(CGFloat)HL_contentInsetLeft
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = HL_contentInsetLeft;
    self.contentInset = inset;
}

- (CGFloat)HL_contentInsetLeft
{
    return self.contentInset.left;
}

- (void)setHL_contentInsetRight:(CGFloat)HL_contentInsetRight
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = HL_contentInsetRight;
    self.contentInset = inset;
}

- (CGFloat)HL_contentInsetRight
{
    return self.contentInset.right;
}

- (void)setHL_contentOffsetX:(CGFloat)HL_contentOffsetX
{
    CGPoint offset = self.contentOffset;
    offset.x = HL_contentOffsetX;
    self.contentOffset = offset;
}

- (CGFloat)HL_contentOffsetX
{
    return self.contentOffset.x;
}

- (void)setHL_contentOffsetY:(CGFloat)HL_contentOffsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = HL_contentOffsetY;
    self.contentOffset = offset;
}

- (CGFloat)HL_contentOffsetY
{
    return self.contentOffset.y;
}

- (void)setHL_contentSizeWidth:(CGFloat)HL_contentSizeWidth
{
    CGSize size = self.contentSize;
    size.width = HL_contentSizeWidth;
    self.contentSize = size;
}

- (CGFloat)HL_contentSizeWidth
{
    return self.contentSize.width;
}

- (void)setHL_contentSizeHeight:(CGFloat)HL_contentSizeHeight
{
    CGSize size = self.contentSize;
    size.height = HL_contentSizeHeight;
    self.contentSize = size;
}

- (CGFloat)HL_contentSizeHeight
{
    return self.contentSize.height;
}

@end
