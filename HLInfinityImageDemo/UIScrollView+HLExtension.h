//
//  UIScrollView+HLExtension.h
//  HLRefreshView
//
//  Created by String on 14/12/28.
//  Copyright (c) 2014年 ___string___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (HLExtension)
@property (assign, nonatomic) CGFloat HL_contentInsetTop;
@property (assign, nonatomic) CGFloat HL_contentInsetBottom;
@property (assign, nonatomic) CGFloat HL_contentInsetLeft;
@property (assign, nonatomic) CGFloat HL_contentInsetRight;

@property (assign, nonatomic) CGFloat HL_contentOffsetX;
@property (assign, nonatomic) CGFloat HL_contentOffsetY;

@property (assign, nonatomic) CGFloat HL_contentSizeWidth;
@property (assign, nonatomic) CGFloat HL_contentSizeHeight;

@end
