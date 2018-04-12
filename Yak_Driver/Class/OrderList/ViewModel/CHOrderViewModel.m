//
//  CHOrderViewModel.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHOrderViewModel.h"
#import "CHOrderModel.h"
#import "CHOrderNewCell.h"
#import "CHOrderReceiveCell.h"

@implementation CHOrderViewModel
// 请求数据
- (void)requestData:(void(^)(void))successBlock faultBlock:(void(^)(void))faultBlock{
    for (int index = 0; index < 5; index++) {
        CHOrderModel *model = [[CHOrderModel alloc]init];
        model.placeName = @"搜诶嘿博森吧";
        model.startTime = @"3月19日 9：00";
        model.endTime = @"3月19日 21：00";
        model.travelName = @"艘我然后呢泊松比背诵";
        model.orderPhone = @"18080087309";
        //1表示新的订单，2表示已接单
        if (index%2==0) {
            model.isRecive = @"1";
        }else{
            model.isRecive = @"2";
        }
        [self.dataModelArray addObject:model];
    }
}
#pragma makr UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataModelArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.dataModelArray[indexPath.row].isRecive isEqualToString:@"1"]) {
        return tRealHeight(135);
    }else{
        return tRealHeight(95);
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *currentCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if ([self.dataModelArray[indexPath.row].isRecive isEqualToString:@"1"]) {
        CHOrderNewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CHOrderNewCell class])];
        cell.model = self.dataModelArray[indexPath.row];
        cell.row = indexPath.row;
        currentCell = cell;
    }else{
        CHOrderReceiveCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CHOrderReceiveCell class])];
        cell.model = self.dataModelArray[indexPath.row];
        cell.row = indexPath.row;
        currentCell = cell;
    }
    return currentCell;
}
- (NSMutableArray<CHOrderModel *> *)dataModelArray{
    if (!_dataModelArray) {
        _dataModelArray = [NSMutableArray array];
    }
    return _dataModelArray;
}

@end
