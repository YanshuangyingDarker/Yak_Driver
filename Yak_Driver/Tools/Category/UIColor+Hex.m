//
//  UIColor+Hex.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+ (UIColor*) colorWithHex:(NSString*)hexValue alpha:(CGFloat)alphaValue
{
    //    NSString *nuber = @"464646";
    //先以16为参数告诉strtoul字符串参数表示16进制数字，然后使用0x%X转为数字类型
    unsigned long sixteen = strtoul([hexValue UTF8String],0,16);
    return [UIColor colorWithRed:((float)((sixteen & 0xFF0000) >> 16))/255.0
                           green:((float)((sixteen & 0xFF00) >> 8))/255.0
                            blue:((float)(sixteen & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*) colorWithHex:(NSString*)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (NSString *) hexFromUIColor: (UIColor*) color {
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    return [NSString stringWithFormat:@"#%x%x%x", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}
@end
