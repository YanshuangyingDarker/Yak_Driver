//
//  NSString+Add.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "NSString+Add.h"

@implementation NSString (Add)
//- (void)appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font
//{
//    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
//
//    NSRange range = NSMakeRange(0, string.length);
//    [attString addAttribute:NSFontAttributeName value:font range:range];
//    [attString addAttribute:NSForegroundColorAttributeName value:color range:range];
//
//    [self appendAttributedString:attString];
//
//    [self app]
//}
-(NSMutableAttributedString *)ch_changeDict:(NSDictionary *)changeDict withRange:(NSRange)range
{
    [self checkRange:range];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    [attributedStr addAttributes:changeDict range:range];
    return attributedStr;
    
}
-(NSMutableAttributedString *)xx_changeDicts:(NSArray<NSDictionary<NSString *,id> *> *)dicts andRanges:(NSArray<NSValue *> *)ranges{
    NSAssert(dicts.count==ranges.count, @"两个数组不对应");
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    [dicts enumerateObjectsUsingBlock:^(NSDictionary<NSString *,id> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self checkRange:  [ranges[idx] rangeValue]];
        [attributedStr addAttributes:obj range:[ranges[idx] rangeValue]];
    }];
    return attributedStr;
}

-(NSMutableAttributedString *)xx_changeWithStr:(NSString *)str withDict:(NSDictionary<NSString *,id> *)changeDict{
    NSRange range=   [self rangeOfString:str];
    NSAssert(range.length!=0, @"str不存在");
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    [attributedStr addAttributes:changeDict range:range];
    return attributedStr;
    
}

+ (NSMutableAttributedString *)addCenterLine:(NSString *)str{
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic];
    return attribtStr;
}
+ (NSMutableAttributedString *)addBottomLine:(NSString *)str{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange titleRange = {0,[str length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    return title;
}
- (BOOL)checkRange:(NSRange)range{
    NSInteger loc = range.location;
    NSInteger len = range.length;
    if (loc>=0 && len>0) {
        if (range.location + range.length <= self.length) {
            return YES;
        }
        else{
            //数组越界
            NSAssert(0, @"The range out-of-bounds!");
            return NO;
        }
    }
    else{
        //range格式有误
        NSAssert(0, @"The range format is wrong: NSMakeRange(a,b) (a>=0,b>0). ");
        return NO;
    }
}

/*!
 *  判断 URL 是否是 MP4
 *
 *  @return YES / NO
 */
+ (BOOL)ch_helperURLIsMp4WithUrl:(NSString *)url
{
    NSString *pathExtention = [url pathExtension];
    if([pathExtention isEqualToString:@"mp4"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
- (BOOL)isEmpty
{
    if (![self isKindOfClass:[NSString class]])
    {
        return YES;
    }
    if (!self)
    {
        return YES;
    }
    if ([self isEqualToString:@"null"]) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([self isEqualToString:@"(null)"])
    {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
    {
        return YES;
    }
    return NO;
}

@end
