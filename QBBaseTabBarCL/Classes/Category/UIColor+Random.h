//
//  UIColor+UIColor_Random.h
//  QBBaseTabBarExample
//
//  Created by wangqibin on 2019/9/7.
//  Copyright © 2019年 wangqibin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Random)
/**
 *  @brief  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)RandomColor;
@end



#define  LMJ_HexColor(hex)        [UIColor colorWithHexString:@#hex]
@interface UIColor (EXtension_LMJ)
// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)color;
@end

NS_ASSUME_NONNULL_END
