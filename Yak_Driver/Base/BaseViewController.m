//
//  BaseViewController.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()



@end

@implementation BaseViewController

- (UIStatusBarStyle)preferredStatusBarStyle{
    return _StatusBarStyle;
}
//动态更新状态栏颜色
-(void)setStatusBarStyle:(UIStatusBarStyle)StatusBarStyle{
    _StatusBarStyle = StatusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    //针对iOS11转场动画导致的view偏移进行修复
    //    if (self.isHidenNaviBar == YES) {
    //        //导航栏隐藏，view top = 0
    //        self.view.top = 0;
    //    }else{
    //        if (self.navigationController) {
    //            CGRect frame = self.view.frame;
    //            frame.origin.y = kTopHeight;
    //            self.view.frame = frame;
    //        }
    //    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //是否显示返回按钮
    self.isShowLiftBack = YES;
    //默认导航栏样式：黑字
    self.StatusBarStyle = UIStatusBarStyleLightContent;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = KWhiteColor;
    //适配iOS11
    [self setSystem];
}
-(void)setSystem{
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight = 0;
    [UITableView appearance].estimatedSectionFooterHeight = 0;
    
    //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    // iOS 11下APP中tableView内容下移20pt或下移64pt
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    }
    // 增加侧滑返回手势，不用实现代理
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    //    [self initBackgroundView];
    
    if (PHONE_X_TYPE) {
        [self repatSetTableViewContentInset];
    }
}
/**
 设置父视图上表格视图的偏移量
 */
- (void)repatSetTableViewContentInset {
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIScrollView *newTableView;
        if ([obj isKindOfClass:[UIScrollView class]]) {
            newTableView = (id)obj;
            newTableView.contentInset = UIEdgeInsetsMake(0, 0, 34, 0);
        }
    }];
}
/**
 *  懒加载UITableView
 *
 *  @return UITableView
 */
//- (UITableView *)tableView
//{
//    if (_tableView == nil) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - kTopHeight -kTabBarHeight) style:UITableViewStylePlain];
//        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        _tableView.estimatedRowHeight = 0;
//        _tableView.estimatedSectionHeaderHeight = 0;
//        _tableView.estimatedSectionFooterHeight = 0;
//
//        //头部刷新
//        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
//        header.automaticallyChangeAlpha = YES;
//        header.lastUpdatedTimeLabel.hidden = NO;
//        _tableView.mj_header = header;
//
//        //底部刷新
//        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
//        //        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
//        //        _tableView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
//
//        _tableView.backgroundColor = kAllBgColor;
//        _tableView.scrollsToTop = YES;
//        _tableView.tableFooterView = [[UIView alloc] init];
//    }
//    return _tableView;
//}
//
///**
// *  懒加载collectionView
// *
// *  @return collectionView
// */
//- (UICollectionView *)collectionView
//{
//    if (_collectionView == nil) {
//        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
//
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , KScreenHeight - kTopHeight - kTabBarHeight) collectionViewLayout:flow];
//        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);;
//        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
//        header.automaticallyChangeAlpha = YES;
//        header.lastUpdatedTimeLabel.hidden = NO;
//        _collectionView.mj_header = header;
//
//        //底部刷新
//        _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
//
//        //#ifdef kiOS11Before
//        //
//        //#else
//        //        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        //        _collectionView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
//        //        _collectionView.scrollIndicatorInsets = _collectionView.contentInset;
//        //#endif
//
//        _collectionView.backgroundColor = kAllBgColor;
//        _collectionView.scrollsToTop = YES;
//    }
//    return _collectionView;
//}
///**
// *  是否显示返回按钮
// */
//- (void) setIsShowLiftBack:(BOOL)isShowLiftBack
//{
//    _isShowLiftBack = isShowLiftBack;
//    NSInteger VCCount = self.navigationController.viewControllers.count;
//    //下面判断的意义是 当VC所在的导航控制器中的VC个数大于1 或者 是present出来的VC时，才展示返回按钮，其他情况不展示
//    if (isShowLiftBack && ( VCCount > 1 || self.navigationController.presentingViewController != nil)) {
//        [self addNavigationItemWithImageNames:@[@"back_icon"] isLeft:YES target:self action:@selector(backBtnClicked) tags:nil];
//
//    } else {
//        self.navigationItem.hidesBackButton = YES;
//        UIBarButtonItem * NULLBar=[[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
//        self.navigationItem.leftBarButtonItem = NULLBar;
//    }
//}
#pragma mark ————— 导航栏 添加图片按钮 —————
/**
 导航栏添加图标按钮
 
 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray * items = [[NSMutableArray alloc] init];
    //调整按钮位置
    //    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    //将宽度设为负值
    //    spaceItem.width= -5;
    //    [items addObject:spaceItem];
    NSInteger i = 0;
    for (NSString * imageName in imageNames) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 10)];
        }else{
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, -10)];
        }
        
        btn.tag = [tags[i++] integerValue];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

#pragma mark ————— 导航栏 添加文字按钮 —————
- (NSMutableArray<UIButton *> *)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    
    //调整按钮位置
    //    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    //将宽度设为负值
    //    spaceItem.width= -5;
    //    [items addObject:spaceItem];
    
    NSMutableArray * buttonArray = [NSMutableArray array];
    NSInteger i = 0;
    for (NSString * title in titles) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        btn.titleLabel.font = SYSTEMFONT(16);
//        [btn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        btn.tag = [tags[i++] integerValue];
        [btn sizeToFit];
        
        //设置偏移
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
        }else{
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        [buttonArray addObject:btn];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
    return buttonArray;
}
- (void)backBtnClicked
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)headerRereshing{
    
}

-(void)footerRereshing{
    
}
- (void)showLoadingAnimation
{
    
}

- (void)stopLoadingAnimation
{
    
}
- (BOOL)shouldAutorotate
{
    // 是否支持旋转
    return NO;
}
@end
