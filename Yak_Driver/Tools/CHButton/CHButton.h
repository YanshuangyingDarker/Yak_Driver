//
//  CHButton.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/12.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CHButtonStyle){
    CHButtonStyleImageLeftTextRight = 1,/**< 图片在左,文字在右*/
    CHButtonStyleImageRightTextLeft = 2,/**< 图片在右,文字在左*/
    CHButtonStyleImageUpTextUnder   = 3,/**< 图片在上,文字在下*/
    CHButtonStyleImageUnderTextUp   = 4,/**< 图片在下,文字在上*/
    CHButtonStyleDefault  = CHButtonStyleImageLeftTextRight/**< 默认系统样式,图片在左,文字在右*/
};
@interface CHButton : UIButton
@property (nonatomic, assign) CHButtonStyle buttonStyle;/**< 按钮样式,默认系统样式(图片在左,文字在右)*/
@property (nonatomic, assign) CGFloat topMarginOffset;/**< 距离顶部边界的偏移量,默认是0*/
@property (nonatomic, assign) CGFloat verticalSpacing;/**< 竖直方向图片和文字间距,默认是0*/
@property (nonatomic, assign) CGFloat horizontalSpacing;/**< 水平方向图片和文字间距,默认是0*/
@end
