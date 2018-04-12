//
//  CHOrderReceiveCell.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHOrderReceiveCell.h"
#import "CHOrderModel.h"
@interface CHOrderReceiveCell()

@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)CHLabel *orderIdentLabel;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)CHLabel *placeLabel;
@property(nonatomic,strong)CHLabel *startTimeLabel;
@property(nonatomic,strong)CHLabel *endTimeLabel;
@property(nonatomic,strong)CHLabel *travelLabel;
@property(nonatomic,strong)UIView *vLine;
@property(nonatomic,strong)UIButton *callBtn;
@end

@implementation CHOrderReceiveCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubViews];
    }
    return self;
}
- (void)addSubViews{
    self.bgView = [UIView new];
    self.bgView.backgroundColor = [UIColor colorWithHex:@"ffffff"];
    [self.bgView addRound:tRealHeight(4)];
    [self.bgView addBorderColor:[UIColor colorWithHex:@"D9D9D9"] BorderWidth:1];
    [self.contentView addSubview:self.bgView];
    
    self.headImage = [UIImageView new];
    self.headImage.image = IMAGE_NAMED(@"pic01");
    self.headImage.contentMode =  UIViewContentModeScaleAspectFit;
    [self.bgView addSubview:self.headImage];
    
    self.orderIdentLabel = [CHLabel labelWithText:@"已接单" textColor:[UIColor colorWithHex:@"999999"] font:SYSTEMFONT(tRealFontSize(12)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.orderIdentLabel];
    
    self.placeLabel = [CHLabel labelWithText:@"" textColor:[UIColor colorWithHex:@"527FE4"] font:SYSTEMFONT(tRealFontSize(16)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.placeLabel];
    
    self.startTimeLabel = [CHLabel labelWithText:@"" textColor:[UIColor colorWithHex:@"A6A6A6"] font:SYSTEMFONT(tRealFontSize(12)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.startTimeLabel];
    
    self.endTimeLabel = [CHLabel labelWithText:@"" textColor:[UIColor colorWithHex:@"A6A6A6"] font:SYSTEMFONT(tRealFontSize(12)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.endTimeLabel];
    
    self.travelLabel = [CHLabel labelWithText:@"" textColor:[UIColor colorWithHex:@"A6A6A6"] font:SYSTEMFONT(tRealFontSize(12)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.travelLabel];
    
    self.vLine = [UIView new];
    self.vLine.backgroundColor = [UIColor colorWithHex:@"D9D9D9"];
    [self.bgView addSubview:self.vLine];
    
    self.callBtn = [UIButton new];
    [self.callBtn setImage:IMAGE_NAMED(@"go_02") forState:UIControlStateNormal];
    self.callBtn.titleLabel.font = SYSTEMFONT(tRealFontSize(15));
    [self.callBtn addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchDown];
    self.callBtn.backgroundColor = KClearColor;
    [self.callBtn sizeToFit];
    [self.bgView addSubview:self.callBtn];
    
    
    //约束
    //布局
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(tRealWidth(12));
        make.right.equalTo(self.contentView.mas_right).offset(-tRealWidth(12));
        make.top.equalTo(self.contentView.mas_top).offset(tRealHeight(15));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-tRealHeight(0));
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).offset(tRealWidth(26));
        make.top.equalTo(self.bgView.mas_top).offset(tRealHeight(18));
        make.size.mas_equalTo(CGSizeMake(tRealWidth(27), tRealHeight(30)));
    }];
    [self.orderIdentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.headImage.mas_centerX);
        make.top.equalTo(self.headImage.mas_bottom).offset(tRealHeight(5));
    }];
    [self.placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(tRealWidth(25));
        make.top.equalTo(self.bgView.mas_top).offset(tRealHeight(13));
    }];
    [self.startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.placeLabel.mas_left);
        make.top.equalTo(self.placeLabel.mas_bottom).offset(tRealHeight(8));
    }];
    [self.endTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.startTimeLabel.mas_right).offset(tRealWidth(5));
        make.centerY.mas_equalTo(self.startTimeLabel.mas_centerY);
    }];
    [self.travelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.placeLabel.mas_left);
        make.top.equalTo(self.endTimeLabel.mas_bottom).offset(tRealHeight(8));
    }];
    [self.vLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView.mas_right).offset(-tRealWidth(69));
        make.bottom.top.mas_equalTo(self.bgView);
        make.width.mas_equalTo(@1);
    }];
    [self.callBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.mas_equalTo(self.bgView);
        make.left.mas_equalTo(self.vLine.mas_right);
    }];
}
- (void)setModel:(CHOrderModel *)model{
    _model = model;
    self.orderIdentLabel.text = [NSString stringWithFormat:@"新订单"];
    self.placeLabel.text = KReplaceNullData(model.placeName);
//    self.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",KReplaceNullData(model.startTime),KReplaceNullData(model.endTime)];
    self.startTimeLabel.attributedText = [KReplaceNullData(model.startTime) ch_changeDict:@{NSFontAttributeName:SYSTEMFONT(tRealFontSize(12.0f)),NSForegroundColorAttributeName:[UIColor colorWithHex:@"527FE4"]} withRange:NSMakeRange(0, 6)];
     self.endTimeLabel.attributedText = [KReplaceNullData(model.endTime) ch_changeDict:@{NSFontAttributeName:SYSTEMFONT(tRealFontSize(12.0f)),NSForegroundColorAttributeName:[UIColor colorWithHex:@"527FE4"]} withRange:NSMakeRange(0, 6)];
     self.travelLabel.text = KReplaceNullData(model.travelName);
}
- (void)callBtnClick:(UIButton *)sender{
    KPostNotification(@"orderCall", (@{@"row":@(self.row),@"btn":sender}));
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
