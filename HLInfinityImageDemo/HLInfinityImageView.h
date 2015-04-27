//
//  HLInfinityImageView.h
//  HLInfinityImageDemo
//
//  Created by String on 15/4/2.
//  Copyright (c) 2015年 ___string___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLInfinityImageView;
@protocol HLInfinityImageViewDelegate <NSObject>

@optional
- (void)infinityScrollView:(HLInfinityImageView *)infinityScrollView didSelectedIndex:(NSInteger)index;
- (void)infinityScrollView:(HLInfinityImageView *)infinityScrollView didChangeIndex:(NSInteger)index;

@end



@class HLInfinityImageViewBuilder;
@interface HLInfinityImageView : UIView
/**
 图片数组 UIImage或NSUrl对象
 */
@property (strong, nonatomic) NSArray *imageArray;
/**
 图片切换的时间 如果为0则不切换
 */
@property (assign, nonatomic) NSTimeInterval interval;
@property (weak, nonatomic) id<HLInfinityImageViewDelegate> delegate;
@property (strong, nonatomic, readonly) UIPageControl *pageControl;

+ (instancetype)infinityScrollViewWithBuilder:(void (^)(HLInfinityImageViewBuilder *builder))builder;
- (void)reloadData;

@end




@interface HLInfinityImageViewBuilder : NSObject

@property (assign, nonatomic) CGRect frame;
/**
 图片数组 UIImage或NSUrl对象
 */
@property (strong, nonatomic) NSArray *imageArray;
/**
 图片切换的时间 如果为0则不切换
 */
@property (assign, nonatomic) NSTimeInterval interval;
@property (weak, nonatomic) id<HLInfinityImageViewDelegate> delegate;

- (HLInfinityImageView *)builder;

@end