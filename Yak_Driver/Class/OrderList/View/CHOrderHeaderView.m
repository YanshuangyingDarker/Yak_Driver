//
//  CHOrderHeaderView.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/12.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHOrderHeaderView.h"

@interface CHOrderHeaderView()
{
    BOOL _isHaveOrder;
    NSString *_travelName;
    NSString *_placeName;
    NSString *_phone;
    NSString *_timeStr;
}
@property(nonatomic,strong)CHLabel *titleLabel;
@property(nonatomic,strong)CHLabel *travelLabel;
@property(nonatomic,strong)CHButton *placeBtn;
@property(nonatomic,strong)CHButton *phoneBtn;

@end
@implementation CHOrderHeaderView

+(CHOrderHeaderView *)shareOrderHeadFrame:(CGRect)frame isHaveOrder:(BOOL)isHaveOrder travelName:(NSString *)travelName placeName:(NSString *)placeName phone:(NSString *)phone timeStr:(NSString *)timeStr{
    CHOrderHeaderView *shareIntance = [[CHOrderHeaderView alloc]initWithFrame:frame isHaveOrder:isHaveOrder travelName:travelName placeName:placeName phone:phone timeStr:timeStr];
    return shareIntance;
}
- (instancetype)initWithFrame:(CGRect)frame isHaveOrder:(BOOL)isHaveOrder travelName:(NSString *)travelName placeName:(NSString *)placeName phone:(NSString *)phone timeStr:(NSString *)timeStr{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHex:@"5D87F3"];
        self.frame = frame;
        _isHaveOrder = isHaveOrder;
        _travelName = travelName;
        _placeName = placeName;
        _phone = phone;
        _timeStr = timeStr;
        [self addSubViews];
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//        [self addSubViews];
//    }
//    return self;
//}

- (void)addSubViews{
    
    if (_isHaveOrder) {
        self.titleLabel = [CHLabel labelWithText:@"今日订单：" textColor:[UIColor colorWithHex:@"FFFFFF"] font:SYSTEMFONT(tRealFontSize(15)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
        self.travelLabel = [CHLabel labelWithText:_travelName textColor:[UIColor colorWithHex:@"FFFFFF"] font:OVERSTRIKINGFONT(tRealFontSize(30)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
        self.placeBtn = [CHButton new];
        self.placeBtn.buttonStyle = CHButtonStyleImageLeftTextRight;
        self.placeBtn.horizontalSpacing = tRealWidth(5);
        [self.placeBtn setImage:IMAGE_NAMED(@"Travel") forState:UIControlStateNormal];
        [self.placeBtn setTitle:_placeName forState:UIControlStateNormal];
        self.placeBtn.titleLabel.font = SYSTEMFONT(tRealFontSize(15));
        self.placeBtn.horizontalSpacing = tRealWidth(5);
//        [self.placeBtn addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchDown];
        self.placeBtn.backgroundColor = KClearColor;
        [self.placeBtn sizeToFit];
        
        
        self.phoneBtn = [CHButton new];
        self.phoneBtn.buttonStyle = CHButtonStyleImageLeftTextRight;
        [self.phoneBtn setImage:IMAGE_NAMED(@"Tel") forState:UIControlStateNormal];
        [self.phoneBtn setTitle:_phone forState:UIControlStateNormal];
        self.phoneBtn.titleLabel.font = SYSTEMFONT(tRealFontSize(15));
        self.phoneBtn.horizontalSpacing = tRealWidth(5);
        //        [self.placeBtn addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchDown];
        self.phoneBtn.backgroundColor = KClearColor;
        [self.phoneBtn sizeToFit];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.travelLabel];
        [self addSubview:self.phoneBtn];
        [self addSubview:self.placeBtn];
        //约束
        [self addAtoLayout];
    }else{
        self.titleLabel = [CHLabel labelWithText:_timeStr textColor:[UIColor colorWithHex:@"D6E8FF"] font:SYSTEMFONT(tRealFontSize(15)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
        self.travelLabel = [CHLabel labelWithText:@"今日暂无订单" textColor:[UIColor colorWithHex:@"FFFFFF"] font:OVERSTRIKINGFONT(tRealFontSize(30)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.travelLabel];
        [self noOrderAtoLayout];
    }
}
- (void)addAtoLayout{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(tRealWidth(26));
        make.top.equalTo(self.mas_top).offset(tRealHeight(19));
    }];
    [self.travelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(tRealWidth(26));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(tRealHeight(9));
    }];
    [self.placeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(tRealWidth(26));
        make.top.equalTo(self.travelLabel.mas_bottom).offset(tRealHeight(20));
    }];
    [self.phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.placeBtn.mas_right).offset(tRealWidth(28));
        make.centerY.mas_equalTo(self.placeBtn.mas_centerY);
    }];
}
- (void)noOrderAtoLayout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(tRealWidth(26));
        make.top.equalTo(self.mas_top).offset(tRealHeight(19));
    }];
    [self.travelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(tRealWidth(26));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(tRealHeight(9));
    }];
}
@end
