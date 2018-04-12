//
//  CHOrderNewCell.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHOrderNewCell.h"
#import "CHOrderModel.h"

@interface CHOrderNewCell()
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)CHLabel *orderIdentLabel;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)CHLabel *placeLabel;
@property(nonatomic,strong)CHLabel *timeLabel;
@property(nonatomic,strong)CHLabel *travelLabel;
@property(nonatomic,strong)UIButton *noBtn;
@property(nonatomic,strong)UIButton *receiveBtn;
@property(nonatomic,strong)UIView *hLine;
@property(nonatomic,strong)UIView *vLine;

@end

@implementation CHOrderNewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubViews];
    }
    return self;
}
- (void)addSubViews{
    self.bgView = [UIView new];
    self.bgView.backgroundColor = [UIColor colorWithHex:@"57B499"];
    [self.bgView addRound:tRealHeight(4)];
    [self.contentView addSubview:self.bgView];
    
    self.headImage = [UIImageView new];
    self.headImage.image = IMAGE_NAMED(@"pic_01");
    self.headImage.contentMode =  UIViewContentModeScaleAspectFit;
    [self.bgView addSubview:self.headImage];
    
    self.orderIdentLabel = [CHLabel labelWithText:@"" textColor:[UIColor colorWithHex:@"A1F3DB"] font:SYSTEMFONT(tRealFontSize(12)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.orderIdentLabel];
   
    self.placeLabel = [CHLabel labelWithText:@"" textColor:[UIColor colorWithHex:@"FFFFFF"] font:SYSTEMFONT(tRealFontSize(16)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.placeLabel];
    
    self.timeLabel = [CHLabel labelWithText:@"" textColor:[UIColor colorWithHex:@"FFFFFF"] font:SYSTEMFONT(tRealFontSize(12)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.timeLabel];
    
    self.travelLabel = [CHLabel labelWithText:@"" textColor:[UIColor colorWithHex:@"A1F3DB"] font:SYSTEMFONT(tRealFontSize(12)) textAlignment:NSTextAlignmentCenter backgroundColor:KClearColor];
    [self.bgView addSubview:self.travelLabel];
    
    self.hLine = [UIView new];
    self.hLine.backgroundColor = [UIColor colorWithHex:@"ffffff"];
    [self.bgView addSubview:self.hLine];
    
    self.vLine = [UIView new];
    self.vLine.backgroundColor = [UIColor colorWithHex:@"ffffff"];
    [self.bgView addSubview:self.vLine];
    
    self.noBtn = [UIButton new];
    [self.noBtn setTitle:@"不接单" forState:UIControlStateNormal];
    [self.noBtn setTitleColor:[UIColor colorWithHex:@"A1F3DB"] forState:UIControlStateNormal];
    self.noBtn.titleLabel.font = SYSTEMFONT(tRealFontSize(15));
    self.noBtn.backgroundColor = KClearColor;
    self.noBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.noBtn addTarget:self action:@selector(noBtnClick) forControlEvents:UIControlEventTouchDown];
    [self.bgView addSubview:self.noBtn];
    
    
    self.receiveBtn = [UIButton new];
    [self.receiveBtn setTitle:@"接单" forState:UIControlStateNormal];
    [self.receiveBtn setTitleColor:[UIColor colorWithHex:@"FFFFFF"] forState:UIControlStateNormal];
    self.receiveBtn.titleLabel.font = SYSTEMFONT(tRealFontSize(15));
    self.receiveBtn.backgroundColor = KClearColor;
    self.receiveBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.receiveBtn addTarget:self action:@selector(receiveBtnClick) forControlEvents:UIControlEventTouchDown];
    [self.bgView addSubview:self.receiveBtn];
    
    //布局
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(tRealWidth(12));
        make.right.equalTo(self.contentView.mas_right).offset(-tRealWidth(12));
        make.top.equalTo(self.contentView.mas_top).offset(tRealHeight(15));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-tRealHeight(0));
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).offset(tRealWidth(26));
        make.top.equalTo(self.bgView.mas_top).offset(tRealHeight(16));
        make.size.mas_equalTo(CGSizeMake(tRealWidth(27), tRealHeight(30)));
    }];
    [self.orderIdentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.headImage.mas_centerX);
        make.top.equalTo(self.headImage.mas_bottom).offset(tRealHeight(5));
    }];
    [self.placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(tRealWidth(25));
        make.top.equalTo(self.bgView.mas_top).offset(tRealHeight(19));
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.placeLabel.mas_left);
        make.top.equalTo(self.placeLabel.mas_bottom).offset(tRealHeight(8));
    }];
    [self.travelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.placeLabel.mas_left);
        make.top.equalTo(self.timeLabel.mas_bottom).offset(tRealHeight(8));
    }];
    [self.hLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.bgView);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-tRealHeight(35));
        make.height.mas_equalTo(@1);
    }];
    [self.vLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.hLine.mas_bottom);
        make.centerX.mas_equalTo(self.bgView);
        make.bottom.mas_equalTo(self.bgView.mas_bottom);
        make.width.mas_equalTo(@1);
    }];
    [self.noBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(self.bgView);
        make.top.mas_equalTo(self.hLine.mas_bottom);
        make.width.mas_equalTo(@(self.contentView.ch_width/2));
    }];
    [self.receiveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self.bgView);
        make.top.mas_equalTo(self.hLine.mas_bottom);
        make.width.mas_equalTo(@(self.contentView.ch_width/2));
    }];
}
- (void)setModel:(CHOrderModel *)model{
    _model = model;
    self.orderIdentLabel.text = [NSString stringWithFormat:@"新订单"];
    self.placeLabel.text = KReplaceNullData(model.placeName);
    self.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",KReplaceNullData(model.startTime),KReplaceNullData(model.endTime)];
    self.travelLabel.text = KReplaceNullData(model.travelName);
}
- (void)receiveBtnClick{
    KPostNotification(@"receive", @(self.row));
}
- (void)noBtnClick{
    KPostNotification(@"noReceive", @(self.row));
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
