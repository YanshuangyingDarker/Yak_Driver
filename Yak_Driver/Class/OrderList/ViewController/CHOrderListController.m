//
//  CHOrderListController.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHOrderListController.h"
#import "CHOrderViewModel.h"
#import "CHOrderView.h"
#import "CHOrderModel.h"
#import "CHOrderHeaderView.h"
#import "ViewController1.h"

@interface CHOrderListController ()
// 控制器对应的view，所以view的初始化，布局在里面做好
@property (nonatomic, strong) CHOrderView *dataView;
// 负责网络请求及其他计算或事件处理
@property (nonatomic, strong) CHOrderViewModel *dataViewModel;
/** selected */
@property (nonatomic, assign)  BOOL selectedRow;

@property(nonatomic,strong)CHOrderHeaderView *headView;

@end

@implementation CHOrderListController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //添加头视图
    [self addHeaderView];
    //添加导航栏按钮
    [self addNavItems];
    //注册通知
    [self registerNotification];
    //设置UI
    [self setOrderView];
    //加载数据
    [self reloadData];
}
- (void)registerNotification{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receive:)
                                                 name:@"receive"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(noReceive:)
                                                 name:@"noReceive"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orderCall:)
                                                 name:@"orderCall"
                                               object:nil];
}
- (void)addNavItems{
    [self addNavigationItemWithImageNames:@[@"my_icon"] isLeft:YES target:self action:@selector(meClick) tags:@[@100]];
}
- (void)addHeaderView{
    self.headView = [CHOrderHeaderView shareOrderHeadFrame:CGRectMake(0, 0, KScreenWidth, tRealHeight(123)) isHaveOrder:NO travelName:@"九寨沟一日游" placeName:@"时候播世博" phone:@"18080087309" timeStr:@"2018.3.10"];
    [self.view addSubview:self.headView];
}
- (void)meClick{
    CHLog(@"11111");
    ViewController1 *v = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:v animated:YES];
}
- (void)setOrderView{
    [self.view addSubview:self.dataView];
}
- (void)reloadData{
    CHKit_WeakSelf
    [self.dataViewModel requestData:^{
        //        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:3];
        //        [weak_self.HomeAllView.collectionView reloadSections:indexSet];
        [weak_self.dataView.bgTabelView reloadData];
    } faultBlock:^{
        
    }];
}
- (void)receive:(NSNotification *)notification{
    NSString *s = [NSString stringWithFormat:@"%@",notification.object];
    [s intValue];
   ((CHOrderModel*)self.dataViewModel.dataModelArray[[s intValue]]).isRecive = @"2";
    [self.dataView.bgTabelView reloadData];
}
- (void)noReceive:(NSNotification *)notification{
//    NSString *s = [NSString stringWithFormat:@"%@",notification.object];
//    [s intValue];
//    ((CHOrderModel*)self.dataViewModel.dataModelArray[[s intValue]]).isRecive = @"2";
//    [self.dataView.bgTabelView reloadData];
}
- (void)orderCall:(NSNotification *)notification{
        NSString *s = [NSString stringWithFormat:@"%@",notification.object];
        [s intValue];
    NSString *phone = ((CHOrderModel*)self.dataViewModel.dataModelArray[[s intValue]]).orderPhone;
    if (self.selectedRow == NO){
        self.selectedRow = YES;
         [self performSelector:@selector(repetitionClick) withObject:nil afterDelay:2.0f];
        UIWebView * callWebview = [[UIWebView alloc] init];
        NSMutableString * str =[[NSMutableString alloc] initWithFormat:@"tel:%@",phone];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
//        [self performSelector:@selector(doSomething:) withObject:[notification.object objectForKey:@"btn"] afterDelay:2];
    }else{
        return;
    }
}
- (void)repetitionClick{
    
    self.selectedRow = NO;
    
}
- (CHOrderViewModel *)dataViewModel
{
    if (!_dataViewModel) {
        _dataViewModel = [[CHOrderViewModel alloc] init];
    }
    return _dataViewModel;
}
- (CHOrderView *)dataView
{
    if (!_dataView) {
        _dataView = [[CHOrderView alloc] initWithFrame:CGRectMake(0, tRealHeight(123), KScreenWidth , KScreenHeight - KDistanceHeight-tRealHeight(123))];
        _dataView.bgTabelView.dataSource = self.dataViewModel;
        _dataView.bgTabelView.delegate = self.dataViewModel;
        _dataView.backgroundColor = KWhiteColor;    }
    return _dataView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
