//
//  CHOrderNewCell.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHOrderModel;

@interface CHOrderNewCell : UITableViewCell

@property(nonatomic,strong)CHOrderModel *model;
@property(nonatomic,assign)NSInteger row;
@end
