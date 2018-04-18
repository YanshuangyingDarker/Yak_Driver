//
//  UtilsMacros.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

#define kSafeAreaBottomHeight (KScreenHeight == 812.0 ? 34 : 0)

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define KDistanceHeight (kSafeAreaBottomHeight + kStatusBarHeight + kNavBarHeight)

//获取屏幕宽高
#define KScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds [UIScreen mainScreen].bounds

// 当前系统版本
#define CurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]
//当前语言
#define CurrentLanguage (［NSLocale preferredLanguages] objectAtIndex:0])

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define CHLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define CHLog(...)
#endif



//取值判空
#define KReplaceNullData(string)  [CHReplaceNullData replaceNullData:string]//字符串判空

//添加图片
#define IMAGE_NAMED(name) [UIImage imageNamed:name]
#define PlaceholderImage IMAGE_NAMED(@"zwtu_xqdt")

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)
//打印当前方法名
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)


//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

#define IPHONE_X                  @"iPhone X" // iPhone X的宏定义
#define PHONE_X_TYPE              [[CHMyDevice currentDevice].deviceType isEqualToString:IPHONE_X]
//iPhone X高度
#define PHONEX_HEIGHT       812.f



#pragma mark - weak / strong
#define CHKit_WeakSelf        @CHKit_Weakify(self);
#define CHKit_StrongSelf      @CHKit_Strongify(self);

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@BAKit_Weakify`实现弱引用转换，`@BAKit_Strongify`实现强引用转换
 *
 * 示例：
 * @CHKit_Weakify
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef CHKit_Weakify
#if DEBUG
#if __has_feature(objc_arc)
#define CHKit_Weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define CHKit_Weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define CHKit_Weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define CHKit_Weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
 * 调用方式: `@BAKit_Weakify(object)`实现弱引用转换，`@BAKit_Strongify(object)`实现强引用转换
 *
 * 示例：
 * @BAKit_Weakify(object)
 * [obj block:^{
 * @BAKit_Strongify(object)
 * strong_object = something;
 * }];
 */
#ifndef CHKit_Strongify
#if DEBUG
#if __has_feature(objc_arc)
#define CHKit_Strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define CHKit_Strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define CHKit_Strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define CHKit_Strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif




#pragma mark - 根据文字内容和大小返回 size
CG_INLINE CGSize
CHKit_LabelSizeWithTextAndFont(NSString *text, UIFont *font){
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    CGSize newSize = CGSizeMake(size.width, size.height);
    return newSize;
}
#pragma mark - 根据文字内容、宽度和字体返回 size
CG_INLINE CGSize
CHKit_LabelSizeWithTextAndWidthAndFont(NSString *text, CGFloat width, UIFont *font){
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    //    if (![text isKindOfClass:[NSString class]] || ![text isKindOfClass:[NSAttributedString class]])
    //    {
    //        NSLog(@"text 错误，此功能仅限 NSString / NSAttributedString 类型！");
    //        return CGSizeZero;
    //    }
    CGRect frame = [text boundingRectWithSize:size
                                      options:
                    NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : style} context:nil];
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
    return newFrame.size;
}


#endif /* UtilsMacros_h */
