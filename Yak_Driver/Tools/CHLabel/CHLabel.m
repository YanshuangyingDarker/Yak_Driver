//
//  CHLabel.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHLabel.h"

@implementation CHLabel

+(instancetype)labelWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                        font:(UIFont *)font
               textAlignment:(NSTextAlignment)textAlignment
             backgroundColor:(UIColor *)bgColor{
    
    CHLabel *chLabel = [[CHLabel alloc]init];
    chLabel.text=text;
    chLabel.textColor=textColor;
    chLabel.font=font;
    chLabel.textAlignment=textAlignment;
    chLabel.backgroundColor=bgColor;
    return chLabel;
}


@end
