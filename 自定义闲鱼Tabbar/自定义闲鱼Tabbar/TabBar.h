//
//  TabBar.h
//  自定义闲鱼Tabbar
//
//  Created by YOUNG on 2017/5/21.
//  Copyright © 2017年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;

@protocol TabBarDelegate <NSObject>
@optional
- (void)tabBarPlusBtnClick:(TabBar *)tabBar;
@end


@interface TabBar : UITabBar

/** tabbar的代理 */
@property (nonatomic, weak) id<TabBarDelegate> myDelegate ;

@end
