//
//  QBIntroductoryPagesView.h
//  QBBaseTabBarExample
//
//  Created by wangqibin on 2019/9/7.
//  Copyright © 2019年 wangqibin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface QBIntroductoryPagesView : UIView
+ (instancetype)pagesViewWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images;

@end

NS_ASSUME_NONNULL_END
