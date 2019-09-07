//
//  QBIntroductoryPagesHelper.h
//  QBBaseTabBarExample
//
//  Created by wangqibin on 2019/9/7.
//  Copyright © 2019年 wangqibin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QBIntroductoryPagesHelper : NSObject
+ (instancetype)shareInstance;

+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray;
@end

NS_ASSUME_NONNULL_END
