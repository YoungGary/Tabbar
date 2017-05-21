//
//  PostViewController.m
//  自定义闲鱼Tabbar
//
//  Created by YOUNG on 2017/5/21.
//  Copyright © 2017年 Young. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
}

- (void)setUpNav
{
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = backItem;
    
}


- (void)pop
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
