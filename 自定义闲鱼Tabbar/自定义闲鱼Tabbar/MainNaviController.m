//
//  MainNaviController.m
//  自定义闲鱼Tabbar
//
//  Created by YOUNG on 2017/5/21.
//  Copyright © 2017年 Young. All rights reserved.
//
#import "UIImage+Image.h"
#import "MainNaviController.h"

#define NavBarColor [UIColor colorWithRed:250/255.0 green:227/255.0 blue:111/255.0 alpha:1.0]
@interface MainNaviController ()

@end

@implementation MainNaviController
//主要做的操作是设置主题 push 隐藏bar
+ (void)load
{
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    dic[NSForegroundColorAttributeName]=[UIColor blackColor];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    [bar setBackgroundImage:[UIImage imageWithColor:NavBarColor] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *dicBar=[NSMutableDictionary dictionary];
    
    dicBar[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    [bar setTitleTextAttributes:dic];
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    
        
        
    }
    
    return [super pushViewController:viewController animated:animated];
}
@end
