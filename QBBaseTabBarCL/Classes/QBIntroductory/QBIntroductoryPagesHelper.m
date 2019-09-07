//
//  QBIntroductoryPagesHelper.m
//  QBBaseTabBarExample
//
//  Created by wangqibin on 2019/9/7.
//  Copyright © 2019年 wangqibin. All rights reserved.
//

#import "QBIntroductoryPagesHelper.h"
#import "QBIntroductoryPagesView.h"


@interface QBIntroductoryPagesHelper ()

@property (weak, nonatomic) UIWindow *curWindow;

@property (strong, nonatomic) QBIntroductoryPagesView *curIntroductoryPagesView;

@end

@implementation QBIntroductoryPagesHelper

static QBIntroductoryPagesHelper *shareInstance_ = nil;
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance_ = [[QBIntroductoryPagesHelper alloc] init];
    });
    
    return shareInstance_;
}

+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray
{
    if (![QBIntroductoryPagesHelper shareInstance].curIntroductoryPagesView) {
        [QBIntroductoryPagesHelper shareInstance].curIntroductoryPagesView = [QBIntroductoryPagesView pagesViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) images:imageArray];
    }
    
    [QBIntroductoryPagesHelper shareInstance].curWindow = [UIApplication sharedApplication].keyWindow;
    [[QBIntroductoryPagesHelper shareInstance].curWindow addSubview:[QBIntroductoryPagesHelper shareInstance].curIntroductoryPagesView];
}

@end
