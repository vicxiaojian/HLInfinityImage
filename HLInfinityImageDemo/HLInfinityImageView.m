//
//  HLInfinityImageView.m
//  HLInfinityImageDemo
//
//  Created by String on 15/4/2.
//  Copyright (c) 2015年 ___string___. All rights reserved.
//

#import "HLInfinityImageView.h"
#import "NSArray+HL_Block.h"
#import "UIScrollView+HLExtension.h"
#import "UIView+HLExtension.h"
#import "UIImageView+WebCache.h"

@interface HLInfinityImageView ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic, readwrite) UIPageControl *pageControl;
@property (strong, nonatomic) NSMutableArray *imageViewArray;
@property (strong, nonatomic) NSMutableArray *showImageArray;

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@property (strong, nonatomic) NSTimer *timerChange;
@property (assign,nonatomic) NSInteger currentIndex;
@end

@implementation HLInfinityImageView

- (NSMutableArray *)imageViewArray {
    if (!_imageViewArray) {
        _imageViewArray = [NSMutableArray array];
    }
    return _imageViewArray;
}

- (NSMutableArray *)showImageArray {
    if (!_showImageArray) {
        _showImageArray = [NSMutableArray array];
    }
    return _showImageArray;
}

+ (instancetype)infinityScrollViewWithBuilder:(void (^)(HLInfinityImageViewBuilder *builder))builder {
    HLInfinityImageViewBuilder *b = [[HLInfinityImageViewBuilder alloc] init];
    builder(b);
    return [b builder];
}

- (void)reloadData {
    if ([self.imageArray HL_empty]) {
        return;
    }
    [self _removeScrollView];
    [self _addScrollView];
    [self _addTimer];
    [self _removePageControl];
    [self _addPageControl];
}

- (void)_removeScrollView {
    if (self.scrollView) {
        [self.scrollView removeFromSuperview];
    }
}

- (void)_addScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)]];
    [self addSubview:self.scrollView];
    
    [self _configureShowImageArrayAndContentSize];
    [self _removeImageViews];
    [self _addImageViews];
}

- (void)_configureShowImageArrayAndContentSize {
    self.showImageArray = [NSMutableArray arrayWithArray:self.imageArray];
    if (self.imageArray.count > 1) {
        [self.showImageArray insertObject:self.imageArray.lastObject atIndex:0];
        [self.showImageArray addObject:self.imageArray.firstObject];
    }
    self.scrollView.contentSize = CGSizeMake(self.HL_width * self.showImageArray.count, self.HL_height);
}

- (void)_removeImageViews {
    [self.imageViewArray HL_each:^(id item) {
        if (item) {
            [item removeFromSuperview];
        }
    }];
    [self.imageViewArray removeAllObjects];
}

- (void)_addImageViews {
    [self.showImageArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSAssert([obj isKindOfClass:[NSURL class]] || [obj isKindOfClass:[UIImage class]], @"image array object must be UIImage or NSUrl");
        CGRect frame = self.bounds;
        frame.origin.x = idx * self.HL_width;
        UIImageView *iv = [[UIImageView alloc] initWithFrame:frame];
        if ([obj isKindOfClass:[NSURL class]]) {
            [iv sd_setImageWithURL:obj];
        }
        else if ([obj isKindOfClass:[UIImage class]]) {
            iv.image = obj;
        }
        [self.scrollView addSubview:iv];
        [self.imageViewArray addObject:iv];
    }];
    self.scrollView.HL_contentOffsetX = self.HL_width;
}

- (void)_addTimer {
    [self.timerChange invalidate];
    self.timerChange = nil;
    
    if (self.interval <= 0) {
        return;
    }
    self.timerChange = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(_scrollToNextImageView) userInfo:nil repeats:YES];
}

- (void)_removePageControl {
    if (self.pageControl) {
        [self.pageControl removeFromSuperview];
    }
}

- (void)_addPageControl {
    UIPageControl *pg = [[UIPageControl alloc] init];
    pg.center = CGPointMake(self.HL_width/2, self.HL_height - 10);
    pg.hidesForSinglePage = YES;
    pg.numberOfPages = self.imageArray.count;
    pg.currentPageIndicatorTintColor = [UIColor colorWithRed:.8 green:0 blue:0 alpha:1];
    pg.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self addSubview:pg];
    
    self.pageControl = pg;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:self.scrollView];
    NSInteger idx = point.x / self.HL_width;
    if (self.delegate && [self.delegate respondsToSelector:@selector(infinityScrollView:didSelectedIndex:)]) {
        [self.delegate infinityScrollView:self didSelectedIndex:idx - 1];
    }
}

#pragma mark - help function

- (void)_scrollToNextImageView {
    [self.scrollView scrollRectToVisible:CGRectMake((self.currentIndex++ % self.showImageArray.count) * self.HL_width, 0, self.HL_width, self.HL_height) animated:YES];
}

- (void)configureContentOffsetX {
    CGFloat progress = self.scrollView.HL_contentOffsetX / self.HL_width;
    
    if (progress <= 0) {
        self.scrollView.HL_contentOffsetX = self.HL_width * self.imageArray.count;
    }
    else if (progress >= self.imageArray.count + 1) {
        self.scrollView.HL_contentOffsetX =  self.HL_width;
    }
}

- (void)configureCurrentIndexChange {
    NSInteger idx = floor((self.scrollView.HL_contentOffsetX + self.HL_width / 2) / self.HL_width);
    NSInteger targerIndex = MIN(self.imageArray.count - 1, MAX(0, idx - 1));
    
    self.pageControl.currentPage = targerIndex;
    if (self.delegate && [self.delegate respondsToSelector:@selector(infinityScrollView:didChangeIndex:)]) {
        [self.delegate infinityScrollView:self didChangeIndex:targerIndex];
    }
}

#pragma mark - scroll view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.currentIndex = floor(self.scrollView.HL_contentOffsetX / self.HL_width);
    
    [self configureContentOffsetX];
    [self configureCurrentIndexChange];
}

@end



@implementation HLInfinityImageViewBuilder

- (HLInfinityImageView *)builder {
    NSAssert(!CGRectEqualToRect(CGRectZero, self.frame), @"frame can not be nil");
    
    HLInfinityImageView *view = [[HLInfinityImageView alloc] initWithFrame:self.frame];
    view.imageArray = self.imageArray;
    view.interval = self.interval;
    view.delegate = self.delegate;
    
    [view reloadData];
    return view;
}

@end