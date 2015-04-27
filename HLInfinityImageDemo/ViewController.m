//
//  ViewController.m
//  HLInfinityImageDemo
//
//  Created by String on 15/4/2.
//  Copyright (c) 2015年 ___string___. All rights reserved.
//

#import "ViewController.h"
#import "HLInfinityImageView.h"

@interface ViewController ()<HLInfinityImageViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *imgArray = @[
                          [NSURL URLWithString:@"http://cdn.duitang.com/uploads/item/201311/28/20131128160205_aBA4S.jpeg"],
                          [NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201311/28/20131128160540_NLRuZ.jpeg"],
                          [NSURL URLWithString:@"http://d.3987.com/yijiaphone_140723/002.jpg"],
                          [NSURL URLWithString:@"http://imgsrc.baidu.com/forum/w%3D580/sign=d16459d150da81cb4ee683c56266d0a4/b31d640e0cf3d7ca07c18e53f31fbe096b63a99b.jpg"],
                          [NSURL URLWithString:@"http://d.3987.com/yijiaphone_140723/002.jpg"],
                          [NSURL URLWithString:@"http://d.3987.com/yijiaphone_140723/002.jpg"],
                          [NSURL URLWithString:@"http://d.3987.com/yijiaphone_140723/002.jpg"],
                          [NSURL URLWithString:@"http://d.3987.com/yijiaphone_140723/002.jpg"],[NSURL URLWithString:@"http://d.3987.com/yijiaphone_140723/002.jpg"],[NSURL URLWithString:@"http://d.3987.com/yijiaphone_140723/002.jpg"],
                          [NSURL URLWithString:@"http://d.3987.com/yijiaphone_140723/002.jpg"],
                          ];
    
    HLInfinityImageView * infinityView = [HLInfinityImageView infinityScrollViewWithBuilder:^(HLInfinityImageViewBuilder *builder) {
        builder.frame = CGRectMake(0, 100, self.view.bounds.size.width, 75);
        builder.imageArray = imgArray;
        builder.delegate = self;
        builder.interval = 1.0f;
    }];
    [self.view addSubview:infinityView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
