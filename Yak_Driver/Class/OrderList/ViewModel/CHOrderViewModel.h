//
//  CHOrderViewModel.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CHOrderModel;

typedef void(^receiveBlock)(void);

@interface CHOrderViewModel : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray <CHOrderModel *>*dataModelArray;

// 请求数据
- (void)requestData:(void(^)(void))successBlock faultBlock:(void(^)(void))faultBlock;
@property (nonatomic,copy)receiveBlock block;
@end
