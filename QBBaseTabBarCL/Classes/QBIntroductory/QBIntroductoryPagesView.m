//
//  QBIntroductoryPagesView.m
//  QBBaseTabBarExample
//
//  Created by wangqibin on 2019/9/7.
//  Copyright © 2019年 wangqibin. All rights reserved.
//

#import "QBIntroductoryPagesView.h"
#import "UIColor+Random.h"

@interface QBIntroductoryPagesView ()<UIScrollViewDelegate>
/** <#digest#> */
@property (nonatomic, strong) NSArray<NSString *> *imagesArray;

@property (nonatomic,strong) UIPageControl *pageControl;

/** <#digest#> */
@property (weak, nonatomic) UIScrollView *scrollView;

@end

@implementation QBIntroductoryPagesView

+ (instancetype)pagesViewWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images
{
    QBIntroductoryPagesView *pagesView = [[self alloc] initWithFrame:frame];
    pagesView.imagesArray = images;
    return pagesView;
}

- (void)setupUIOnce
{
    self.backgroundColor = [UIColor clearColor];
    
    //添加手势
    UITapGestureRecognizer *singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTapFrom)];
    singleRecognizer.numberOfTapsRequired = 1;
    [self.scrollView addGestureRecognizer:singleRecognizer];
}

- (void)setImagesArray:(NSArray<NSString *> *)imagesArray {
    _imagesArray = imagesArray;
    [self loadPageView];
}

- (void)loadPageView
{
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.scrollView.contentSize = CGSizeMake((self.imagesArray.count + 1) * kScreenWidth, kScreenHeight);
    self.pageControl.numberOfPages = self.imagesArray.count;
    
    [self.imagesArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
//        YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc]init];
//        imageView.frame = CGRectMake(idx * kScreenWidth, 0, kScreenWidth, kScreenHeight);
//        YYImage *image = [YYImage imageNamed:obj];
//        [imageView setImage:image];
//        [self.scrollView addSubview:imageView];
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(idx * kScreenWidth, 0, kScreenWidth, kScreenHeight);
        if (idx == (self.imagesArray.count - 1)) {
            UIButton *passBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-70.0f, 40.0f, 50.0f, 40.0f)];
            [passBtn setImage:[UIImage imageNamed:@"default_pass"] forState:UIControlStateNormal];
            [imageView addSubview:passBtn];
        }
        UIImage *image = [UIImage imageNamed:obj];
        [imageView setImage:image];
        [self.scrollView addSubview:imageView];
    }];
}

-(void)handleSingleTapFrom
{
    if (_pageControl.currentPage == self.imagesArray.count-1) {
        [self removeFromSuperview];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offSet = scrollView.contentOffset;
    NSInteger page = (offSet.x / (self.bounds.size.width) + 0.5);
    self.pageControl.currentPage = page;//计算当前的页码
    self.pageControl.hidden = (page > self.imagesArray.count - 1);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x >= (_imagesArray.count) * kScreenWidth) {
        [self removeFromSuperview];
    }
}

- (UIScrollView *)scrollView
{
    if(!_scrollView)
    {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:scrollView];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.pagingEnabled = YES;//设置分页
        scrollView.bounces = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.delegate = self;
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if(!_pageControl)
    {
        UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth/2, kScreenHeight - 60, 0, 40)];
        pageControl.backgroundColor = [UIColor RandomColor];
        pageControl.pageIndicatorTintColor = [UIColor RandomColor];
        pageControl.currentPageIndicatorTintColor = [UIColor RandomColor];
        [self addSubview:pageControl];
        _pageControl = pageControl;
    }
    return _pageControl;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUIOnce];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUIOnce];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
