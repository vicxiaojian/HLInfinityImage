# HLInfinityImage
A scrollView banner for the App.
You can use the ThirdPart like this：

<HLInfinityImageViewDelegate>   A protocol you need to fllow.

_bannerScrollView = [HLInfinityImageView infinityScrollViewWithBuilder:^(HLInfinityImageViewBuilder *builder) {
    //builder.frame = CGRectMake(0, 0, CURRENT_WIDTH, CURRENT_WIDTH / 320 * BannerHeight); 
    builder.imageArray = model.bannerAdArray; 
    builder.delegate = self; 
    builder.interval = 1.5f; 
}];
