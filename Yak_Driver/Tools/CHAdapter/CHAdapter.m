//
//  CHAdapter.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHAdapter.h"

/*所需适配机型-屏幕宽*/
CGFloat const SCREEN_WIDTH_iPhone3GS_4_4S       = 320.0f;
CGFloat const SCREEN_WIDTH_iPhone5_5C_5S_5SE    = 320.0f;
CGFloat const SCREEN_WIDTH_iPhone6_6S_7_8       = 375.0f;
CGFloat const SCREEN_WIDTH_iPhone6Plus_6SPlus_7Plus_8Plus  = 414.0f;
CGFloat const SCREEN_WIDTH_iPhoneX              = 375.0f;

/*所需适配机型-屏幕高*/
CGFloat const SCREEN_HEIGHT_iPhone3GS_4_4S      = 480.0f;
CGFloat const SCREEN_HEIGHT_iPhone5_5C_5S_5SE   = 568.0f;
CGFloat const SCREEN_HEIGHT_iPhone6_6S_7_8      = 667.0f;
CGFloat const SCREEN_HEIGHT_iPhone6Plus_6SPlus_7Plus_8Plus = 736.0f;
CGFloat const SCREEN_HEIGHT_iPhoneX             = 812.0f;

@implementation CHAdapter

/*共享*/
+ (instancetype)shareAdapter{
    static dispatch_once_t onceToken;
    static CHAdapter * _instance = nil;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

/*重载方法*/
- (instancetype)init{
    if (self = [super init]) {
        self.defaultType = CHAdapterPhoneType_iPhone6_6S_7_8;
    }
    return self;
}
/*设置默认类型*/
- (void)setDefaultType:(CHAdapterPhoneType)defaultType {
    _defaultType = defaultType;
    switch (_defaultType) {
        case CHAdapterPhoneType_iPhone3GS_4_4S:
            _defaultScreenWidth  = SCREEN_WIDTH_iPhone3GS_4_4S;
            _defaultScreenHeight = SCREEN_HEIGHT_iPhone3GS_4_4S;
            break;
        case CHAdapterPhoneType_iPhone5_5C_5S_5SE:
            _defaultScreenWidth  = SCREEN_WIDTH_iPhone5_5C_5S_5SE;
            _defaultScreenHeight = SCREEN_HEIGHT_iPhone5_5C_5S_5SE;
            break;
        case CHAdapterPhoneType_iPhone6_6S_7_8:
            _defaultScreenWidth  = SCREEN_WIDTH_iPhone6_6S_7_8;
            _defaultScreenHeight = SCREEN_HEIGHT_iPhone6_6S_7_8;
            break;
        case CHAdapterPhoneType_iPhone6Plus_6SPlus_7Plus_8Plus:
            _defaultScreenWidth  = SCREEN_WIDTH_iPhone6Plus_6SPlus_7Plus_8Plus;
            _defaultScreenHeight = SCREEN_HEIGHT_iPhone6Plus_6SPlus_7Plus_8Plus;
            break;
        case CHAdapterPhoneType_iPhoneX:
            _defaultScreenWidth  = SCREEN_WIDTH_iPhoneX;
            _defaultScreenHeight = SCREEN_HEIGHT_iPhoneX;
            break;
        case CHAdapterPhoneTypeOther:
            break;
        default:
            break;
    }
}

@end
