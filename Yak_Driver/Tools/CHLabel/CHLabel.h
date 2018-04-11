//
//  CHLabel.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHLabel : UILabel
+(instancetype)labelWithText:(NSString *)text
                   textColor:(UIColor *)textColor
                        font:(UIFont *)font
               textAlignment:(NSTextAlignment)textAlignment
             backgroundColor:(UIColor *)bgColor;
@end
