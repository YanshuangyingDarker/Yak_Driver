//
//  CHOrderView.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHOrderView.h"
#import "CHOrderNewCell.h"
#import "CHOrderReceiveCell.h"

@implementation CHOrderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self layout];
    }
    return self;
}
- (void)layout
{
    self.bgTabelView.backgroundColor = KWhiteColor;
    [self.bgTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
- (UITableView *)bgTabelView
{
    if (!_bgTabelView) {
        _bgTabelView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        _bgTabelView.scrollEnabled = NO;
        _bgTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_bgTabelView registerClass:[CHOrderNewCell class] forCellReuseIdentifier:NSStringFromClass([CHOrderNewCell class])];
        [_bgTabelView registerClass:[CHOrderReceiveCell class] forCellReuseIdentifier:NSStringFromClass([CHOrderReceiveCell class])];

        [self addSubview:_bgTabelView];
    }
    return _bgTabelView;
}

@end
