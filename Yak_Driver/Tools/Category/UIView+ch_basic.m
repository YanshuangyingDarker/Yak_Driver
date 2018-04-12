//
//  UIView+ch_basic.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "UIView+ch_basic.h"

@implementation UIView (ch_basic)
- (void)setch_x:(CGFloat)ch_x {
    
    CGRect frame = self.frame;
    frame.origin.x = ch_x;
    self.frame = frame;
}
- (void)setch_y:(CGFloat)ch_y {
    
    CGRect frame = self.frame;
    frame.origin.y = ch_y;
    self.frame = frame;
}
- (void)setch_width:(CGFloat)ch_width {
    
    CGRect frame = self.frame;
    frame.size.width = ch_width;
    self.frame = frame;
}
- (void)setch_height:(CGFloat)ch_height {
    
    CGRect frame = self.frame;
    frame.size.height = ch_height;
    self.frame = frame;
}

- (CGFloat)ch_x {
    return self.frame.origin.x;
}
- (CGFloat)ch_y {
    return self.frame.origin.y;
    
}
- (CGFloat)ch_width {
    return self.frame.size.width;
}
- (CGFloat)ch_height {
    return self.frame.size.height;
}
- (void)setch_size:(CGSize)ch_size {
    CGRect frema = self.frame;
    frema.size = ch_size;
    self.frame = frema;
}
- (CGSize)ch_size {
    return self.frame.size;
}
- (CGFloat)ch_centerX {
    return self.center.x;
}
- (void)setch_centerX:(CGFloat)ch_centerX {
    CGPoint center = self.center;
    center.x = ch_centerX;
    self.center = center;
}
- (CGFloat)ch_centerY {
    return self.center.y;
}
- (void)setch_centerY:(CGFloat)ch_centerY {
    CGPoint center = self.center;
    center.y = ch_centerY;
    self.center = center;
}
/** - 判断一个控件是否真正显示在主窗口 - */
- (BOOL)isShowingOnKeyWindow {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    // 将控件的相对于它父视图的frame转换为相对于wind的frame
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBouns = keyWindow.bounds;
    // 判断两个frame是否相交
    BOOL Intersects = CGRectIntersectsRect(newFrame, winBouns);
    // 没有隐藏 && 能看见 && 是主窗口的子控件 && 有相交
    return !self.hidden && self.alpha > 0.01 && self.window == keyWindow && Intersects;
}
/** 切圆角 */
- (void)addRound:(CGFloat)round{
    self.layer.cornerRadius = round;
    //将多余的部分切掉
    self.layer.masksToBounds = YES;
}

/** 贝塞尔切圆角(待测试) */
- (void) BezierChopRound:(CGFloat) round{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(round, round)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
/** 切圆 (fram确定情况下才能使用)*/
- (void)chopRound{
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = circlePath.CGPath;
    self.layer.mask = maskLayer;
}
/** 切圆 */
- (void)chopRoundWidth:(CGFloat) width{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, width *2, width *2)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = circlePath.CGPath;
    self.layer.mask = maskLayer;
}
/** - 给一个控件画边框 - */
- (void) addBorderColor:(UIColor *) color BorderWidth:(CGFloat) width{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}
/** 返回相对于窗口的frame */
- (CGRect)returenToWindowRect{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect rect = [self convertRect:self.bounds toView:window];
    return rect;
}
/** 返回相对于某个视图frame */
- (CGRect) returenToViewRect:(UIView *)view{
    CGRect rect = [self convertRect:self.bounds toView:view];
    return rect;
}
- (UIImage *)YQ_drawRectWithRoundedCornerRadius:(CGFloat)radius
                                    borderWidth:(CGFloat)borderWidth
                                backgroundColor:(UIColor *)backgroundColor
                                   borderCorlor:(UIColor *)borderColor {
    CGSize sizeToFit = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    CGFloat halfBorderWidth = borderWidth / 2.0;
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    
    CGFloat width = sizeToFit.width, height = sizeToFit.height;
    CGContextMoveToPoint(context, width - halfBorderWidth, radius + halfBorderWidth); // 准备开始移动坐标
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius);
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius); // 左下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, radius); // 左上角
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, radius);
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)animationWithAlertView {
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.15;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.layer addAnimation:animation forKey:nil];
}
/* 3.创建边框 */
- (void)ch_setBordersWithColor:(UIColor *)color
               andCornerRadius:(CGFloat)radius
                      andWidth:(CGFloat)width
{
    // 设置边框宽度
    self.layer.borderWidth = width;
    // 设置圆角半径
    self.layer.cornerRadius = radius;
    // 设置是否栅格化
    self.layer.shouldRasterize = NO;
    // 设置栅格化规模
    self.layer.rasterizationScale = 2;
    // 设置边缘抗锯齿遮盖
    self.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
    // 设置边界剪切
    self.clipsToBounds = YES;
    // 设置边界是否遮盖
    self.layer.masksToBounds = YES;
    
    // 创建颜色空间
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGColorRef cgColor = [color CGColor];
    self.layer.borderColor = cgColor;
    CGColorSpaceRelease(space);
}

/* 4.删除边框 */
- (void)ch_removeBorders
{
    self.layer.borderWidth = 0;
    self.layer.cornerRadius = 0;
    self.layer.borderColor = nil;
}

/* 5.删除阴影 */
- (void)ch_removeShadow
{
    [self.layer setShadowColor:[[UIColor clearColor] CGColor]];
    [self.layer setShadowOpacity:0.0f];
    [self.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
}

///* 6.设置圆角半径 */
//- (void)ba_setCornerRadius:(CGFloat)radius
//{
//    CALayer *roundedlayer = [self layer];
//    roundedlayer.cornerRadius = radius;
//    [roundedlayer setMasksToBounds:YES];
//}

/* 7.创建阴影 */
- (void)ch_setRectShadowWithOffset:(CGSize)offset
                           opacity:(CGFloat)opacity
                            radius:(CGFloat)radius
{
    // 设置阴影的颜色
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    // 设置阴影的透明度
    self.layer.shadowOpacity = opacity;
    // 设置阴影的偏移量
    self.layer.shadowOffset = offset;
    // 设置阴影的模糊程度
    self.layer.shadowRadius = radius;
    // 设置边界是否遮盖
    self.layer.masksToBounds = NO;
}
/* 8.创建圆角半径阴影 */
- (void)ba_setCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
                                          offset:(CGSize)offset
                                         opacity:(CGFloat)opacity
                                          radius:(CGFloat)radius
{
    // 设置阴影的颜色
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    // 设置阴影的透明度
    self.layer.shadowOpacity = opacity;
    // 设置阴影的偏移量
    self.layer.shadowOffset = offset;
    // 设置阴影的模糊程度
    self.layer.shadowRadius = radius;
    // 设置是否栅格化
    self.layer.shouldRasterize = YES;
    // 设置圆角半径
    self.layer.cornerRadius = cornerRadius;
    // 设置阴影的路径
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds]
                                                        cornerRadius:cornerRadius] CGPath];
    // 设置边界是否遮盖
    self.layer.masksToBounds = NO;
}

- (UIView*)subViewOfClassName:(NSString*)className {
    for (UIView* subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }
        
        UIView* resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }
    return nil;
}

#pragma mark - 给view设置边框
+ (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}

@end
