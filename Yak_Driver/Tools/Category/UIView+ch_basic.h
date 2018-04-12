//
//  UIView+ch_basic.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ch_basic)

@property (nonatomic, assign) CGFloat ch_x;
@property (nonatomic, assign) CGFloat ch_y;
@property (nonatomic, assign) CGFloat ch_width;
@property (nonatomic, assign) CGFloat ch_height;
@property (nonatomic, assign) CGSize  ch_size;
@property (nonatomic, assign) CGFloat ch_centerX;
@property (nonatomic, assign) CGFloat ch_centerY;
/*分类中声明@property 只会生成方法的声明 没有实现 也没有成员变量*/


/** - 判断一个控件是否真正显示在主窗口 - */
- (BOOL)isShowingOnKeyWindow;
/** 切圆角 */
- (void) addRound:(CGFloat) round;
/** 贝塞尔切圆角(待测试) */
- (void) BezierChopRound:(CGFloat) round;
/** 切圆 切圆 (fram确定情况下才能使用) */
- (void)chopRound;
/** 切圆 */
- (void)chopRoundWidth:(CGFloat) width;
/** 添加边框 */
- (void) addBorderColor:(UIColor *) color BorderWidth:(CGFloat) width;
/** 返回相对于窗口的frame */
- (CGRect) returenToWindowRect;
/** 返回相对于某个视图frame */
- (CGRect) returenToViewRect:(UIView *)view;

-(void)animationWithAlertView;

- (UIImage *)YQ_drawRectWithRoundedCornerRadius:(CGFloat)radius
                                    borderWidth:(CGFloat)borderWidth
                                backgroundColor:(UIColor *)backgroundColor
                                   borderCorlor:(UIColor *)borderColor;


/**
 *  3.创建边框
 */
- (void)ch_setBordersWithColor:(UIColor *)color
               andCornerRadius:(CGFloat)radius
                      andWidth:(CGFloat)width;

/**
 *  4.删除边框
 */
- (void)ch_removeBorders;

/**
 *  5.创建阴影
 */
- (void)ch_setRectShadowWithOffset:(CGSize)offset
                           opacity:(CGFloat)opacity
                            radius:(CGFloat)radius;

/**
 *  6.删除阴影
 */
- (void)ch_removeShadow;

/**
 *  7.创建圆角半径阴影
 */
- (void)ba_setCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
                                          offset:(CGSize)offset
                                         opacity:(CGFloat)opacity
                                          radius:(CGFloat)radius;

- (UIView*)subViewOfClassName:(NSString*)className;



#pragma mark - 给view设置边框
+ (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;

@end
