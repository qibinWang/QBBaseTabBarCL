//
//  QBTabBarController.m
//  QBBaseTabBarExample
//
//  Created by wangqibin on 2019/9/7.
//  Copyright © 2019年 wangqibin. All rights reserved.
//

#import "QBTabBarController.h"
#import "QBNavigationController.h"

@interface QBTabBarController ()<UITabBarControllerDelegate>

@end

@implementation QBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
    [self addTabarItems];
    self.delegate = self;
}
- (void)customIsInGod:(NSNotification *)noti {
    if (![noti.object boolValue]) {
        return;
    }
}

- (void)addChildViewControllers
{
    //在此处添加控制器
    QBNavigationController *one = [[QBNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    QBNavigationController *two = [[QBNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    QBNavigationController *three = [[QBNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    QBNavigationController *four = [[QBNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    self.viewControllers = @[ one,two,three, four];
}

- (void)addTabarItems
{
    //在此处设置名称和图片
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"基础",
                                                 @"TabBarItemImage" : @"tabBar_essence_icon",
                                                 @"TabBarItemSelectedImage" : @"tabBar_essence_click_icon",
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"预演",
                                                  @"TabBarItemImage" : @"tabBar_friendTrends_icon",
                                                  @"TabBarItemSelectedImage" : @"tabBar_friendTrends_click_icon",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"实例",
                                                 @"TabBarItemImage" : @"tabBar_new_icon",
                                                 @"TabBarItemSelectedImage" : @"tabBar_new_click_icon",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"分享",
                                                  @"TabBarItemImage" : @"tabBar_me_icon",
                                                  @"TabBarItemSelectedImage" : @"tabBar_me_click_icon"
                                                  };
    
    NSArray<NSDictionary *>  *tabBarItemsAttributes = @[   firstTabBarItemsAttributes,
                                                            secondTabBarItemsAttributes,
                                                            thirdTabBarItemsAttributes,
                                                            fourthTabBarItemsAttributes
                                                            ];
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.tabBarItem.title = tabBarItemsAttributes[idx][@"TabBarItemTitle"];
        obj.tabBarItem.image = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemImage"]];
        obj.tabBarItem.selectedImage = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemSelectedImage"]];
        obj.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    }];
    self.tabBar.tintColor = [UIColor redColor];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

@end
