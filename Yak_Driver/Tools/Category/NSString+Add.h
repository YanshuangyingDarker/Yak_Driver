//
//  NSString+Add.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Add)
#pragma mark - 改变单个范围字体的大小和颜色
/**
 *  改变字体大小
 *
 *  @param type  改变的type
 *  @param range 范围(NSRange)
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
//- (NSMutableAttributedString *)xx_changeType:(XXChangeAttributeType )type
//                                 withRange:(NSRange)range;

- (NSMutableAttributedString *)ch_changeDict:( NSDictionary<NSString *, id> *)changeDict
                                   withRange:(NSRange)range;

#pragma mark - 改变多个范围内的字体和颜色

/**
 *  改变多段字符串为一种颜色
 *
 *  @param dicts  改变的字典数组（数组里面的字典对应改变的属性和值）
 *  @param ranges 范围数组:[NSValue valueWithRange:NSRange]
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
- (NSMutableAttributedString *)ch_changeDicts:(NSArray <NSDictionary <NSString *, id>* >*)dicts andRanges:(NSArray<NSValue *> *)ranges;



#pragma mark - 对特定字符进行改变
/**
 *  对相应的字符串进行改变
 *
 *  @param str   需要改变的字符串
 *  @param changeDict 改变的属性字典
 *
 *  @return 转换后的富文本（NSMutableAttributedString）
 */
- (NSMutableAttributedString *)ch_changeWithStr:(NSString *)str withDict:(NSDictionary<NSString *, id> *)changeDict;

//中划线
+ (NSMutableAttributedString *)addCenterLine:(NSString *)str;
//下划线
+ (NSMutableAttributedString *)addBottomLine:(NSString *)str;
/*!
 *  判断 URL 是否是 MP4
 *
 *  @return YES / NO
 */
+ (BOOL)ch_helperURLIsMp4WithUrl:(NSString *)url;

/*!
 *  判断 是否为空
 */
- (BOOL)isEmpty;
@end
