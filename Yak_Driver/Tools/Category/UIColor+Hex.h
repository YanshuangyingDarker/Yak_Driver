//
//  UIColor+Hex.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*) colorWithHex:(NSString*)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithHex:(NSString*)hexValue;
+ (NSString *) hexFromUIColor: (UIColor*) color;

@end
