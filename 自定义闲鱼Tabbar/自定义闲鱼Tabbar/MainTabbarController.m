//
//  MainTabbarController.m
//  自定义闲鱼Tabbar
//
//  Created by YOUNG on 2017/5/21.
//  Copyright © 2017年 Young. All rights reserved.
//

#import "MainTabbarController.h"
#import "TabBar.h"
#import "HomeViewController.h"
#import "FishViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "PostViewController.h"
#import "MainNaviController.h"
@interface MainTabbarController ()<TabBarDelegate>

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildVCs];
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    TabBar *tabbar = [[TabBar alloc] init];
    tabbar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];
}

+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}

-(void)setupChildVCs{
    HomeViewController *HomeVC = [[HomeViewController alloc] init];
    [self setUpOneChildVcWithVc:HomeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"首页"];
    
    FishViewController *FishVC = [[FishViewController alloc] init];
    [self setUpOneChildVcWithVc:FishVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:@"鱼塘"];
    
    MessageViewController *MessageVC = [[MessageViewController alloc] init];
    [self setUpOneChildVcWithVc:MessageVC Image:@"message_normal" selectedImage:@"message_highlight" title:@"消息"];
    
    MineViewController *MineVC = [[MineViewController alloc] init];
    [self setUpOneChildVcWithVc:MineVC Image:@"account_normal" selectedImage:@"account_highlight" title:@"我的"];
}

- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    MainNaviController *nav = [[MainNaviController alloc] initWithRootViewController:Vc];
    
    
    Vc.view.backgroundColor = [self randomColor];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}

//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(TabBar *)tabBar
{
    
    
    PostViewController *plusVC = [[PostViewController alloc] init];
    plusVC.view.backgroundColor = [self randomColor];
    
    MainNaviController *navVc = [[MainNaviController alloc] initWithRootViewController:plusVC];
    
    [self presentViewController:navVc animated:YES completion:nil];
    
    
    
}


- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}







@end
