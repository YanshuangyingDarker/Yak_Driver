//
//  UIImage+Add.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/12.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Add)
/**
 Create and return a 1x1 point size image with the given color.
 
 @param color  The color.
 */
+ (nullable UIImage *)imageWithColor:(UIColor *)color;
@end
