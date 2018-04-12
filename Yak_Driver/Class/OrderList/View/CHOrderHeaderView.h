//
//  CHOrderHeaderView.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/12.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHOrderHeaderView : UIView

//- (instancetype)initWithFrame:(CGRect)frame isHaveOrder:(BOOL)isHaveOrder travelName:(NSString *)travelName placeName:(NSString *)placeName;
+(CHOrderHeaderView *)shareOrderHeadFrame:(CGRect)frame isHaveOrder:(BOOL)isHaveOrder travelName:(NSString *)travelName placeName:(NSString *)placeName phone:(NSString *)phone timeStr:(NSString *)timeStr;


@end
