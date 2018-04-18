//
//  BaseNavigationController.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/12.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIImage+Add.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

//APP生命周期中 只会执行一次
+ (void)initialize
{
    //导航栏主题 title文字属性
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.translucent = NO;
    //导航栏背景图
    [navBar setBarTintColor:[UIColor colorWithHex:@"5D87F3"]];
    [navBar setTintColor:[UIColor colorWithHex:@"ffffff"]];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor colorWithHex:@"ffffff"], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
//    [navigationBar setBackgroundImage:[UIImage imageWithColor:[self colorFromHexRGB:@"33cccc"]]
//                       forBarPosition:UIBarPositionAny
//                           barMetrics:UIBarMetricsDefault];
    [navBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:@"5D87F3"]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[UIImage new]];//去掉阴影线
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //默认开启系统右划返回
//    self.interactivePopGestureRecognizer.enabled = YES;
//    self.interactivePopGestureRecognizer.delegate = self;
//    
}



@end
