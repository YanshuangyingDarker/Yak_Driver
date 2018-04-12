//
//  ViewController1.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/12.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (UIBarButtonItem *)customBackItemWithTarget:(id)target action:(SEL)action
{
    CHButton *button = [CHButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"backarrow_icon"] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.buttonStyle = CHButtonStyleImageLeftTextRight;
    button.horizontalSpacing = tRealWidth(12);
    [button sizeToFit];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
