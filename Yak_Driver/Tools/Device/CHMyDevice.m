//
//  CHMyDevice.m
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "CHMyDevice.h"
#import <sys/utsname.h>
#import <UIKit/UIKit.h>

@interface CHMyDevice()

@property(nonatomic,strong)NSString *storedUUID;

@end

@implementation CHMyDevice
// 重写初始化方法,让其抛异常，不能调用该方法
- (instancetype)init
{
    // 1. 抛出异常方式,让程序猿不能调用此方法初始化该对象
    @throw [NSException exceptionWithName:@"DataBaseManager init" reason:@"不能调用init方法初始化对象" userInfo:nil];
    // 2. 断言，判定言论，程序崩溃
    //    NSAssert(NO, @"DataBaseManager无法调用该方法");
    return self;
}

+ (instancetype)currentDevice {
    static CHMyDevice *sharedUser = nil;
    static dispatch_once_t stoken;
    dispatch_once(&stoken, ^{
        if (!sharedUser) {
            sharedUser = [[self alloc] initPrivate];
        }
    });
    return sharedUser;
}

// 重新实现初始化方法
- (instancetype)initPrivate
{
    if (self = [super init]) {
        self.deviceType = [self iphoneType];
        self.version = [self getVersionMyDevice];
        self.appName = @"creditSecond";
        self.deviceName = [UIDevice currentDevice].name;
#if UIKIT_DEFINE_AS_PROPERTIES
        //        self.deviceName =[UIDevice currentDevice].name;
        self.systemName = [NSString stringWithFormat:@"iOS%@",[UIDevice currentDevice].systemVersion];
#else
        //        self.deviceName =[UIDevice currentDevice].name;
        self.systemName = [NSString stringWithFormat:@"iOS%@",[UIDevice currentDevice].systemVersion];
#endif
        
    }
    return self;
}

- (NSString *)getVersionMyDevice {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    return version;
}
- (NSString *)iphoneType {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if (KScreenHeight == PHONEX_HEIGHT) return IPHONE_X;
    if (platform) {
        if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
        
        if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
        
        if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
        
        if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
        
        if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
        
        if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
        
        if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
        
        if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
        
        if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
        
        if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
        
        if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
        
        if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
        
        if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
        
        if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
        
        if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
        
        if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
        
        if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
        
        if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
        
        if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
        
        if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
        
        if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
        
        if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
        
        if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
        
        if ([platform isEqualToString:@"iPod1,1"])return  @"iPod Touch 1G";
        
        if ([platform isEqualToString:@"iPod2,1"])return @"iPod Touch 2G";
        
        if ([platform isEqualToString:@"iPod3,1"])return @"iPod Touch 3G";
        
        if ([platform isEqualToString:@"iPod4,1"])return @"iPod Touch 4G";
        
        if ([platform isEqualToString:@"iPod5,1"])return @"iPod Touch 5G";
        
        if ([platform isEqualToString:@"iPad1,1"])return @"iPad 1G";
        
        if ([platform isEqualToString:@"iPad2,1"])return @"iPad 2";
        
        if ([platform isEqualToString:@"iPad2,2"])return @"iPad 2";
        
        if ([platform isEqualToString:@"iPad2,3"])return @"iPad 2";
        
        if ([platform isEqualToString:@"iPad2,4"])return @"iPad 2";
        
        if ([platform isEqualToString:@"iPad2,5"])return @"iPad Mini 1G";
        
        if ([platform isEqualToString:@"iPad2,6"])return @"iPad Mini 1G";
        
        if ([platform isEqualToString:@"iPad2,7"])return @"iPad Mini 1G";
        
        if ([platform isEqualToString:@"iPad3,1"])return @"iPad 3";
        
        if ([platform isEqualToString:@"iPad3,2"])return @"iPad 3";
        
        if ([platform isEqualToString:@"iPad3,3"])return @"iPad 3";
        
        if ([platform isEqualToString:@"iPad3,4"])return @"iPad 4";
        
        if ([platform isEqualToString:@"iPad3,5"])return @"iPad 4";
        
        if ([platform isEqualToString:@"iPad3,6"])return @"iPad 4";
        
        if ([platform isEqualToString:@"iPad4,1"])return @"iPad Air";
        
        if ([platform isEqualToString:@"iPad4,2"])return @"iPad Air";
        
        if ([platform isEqualToString:@"iPad4,3"])return @"iPad Air";
        
        if ([platform isEqualToString:@"iPad4,4"])return @"iPad Mini 2G";
        
        if ([platform isEqualToString:@"iPad4,5"])return @"iPad Mini 2G";
        
        if ([platform isEqualToString:@"iPad4,6"])return @"iPad Mini 2G";
        
        if ([platform isEqualToString:@"i386"])return @"iPhone Simulator";
        
        if ([platform isEqualToString:@"x86_64"])return @"iPhone Simulator";
        
        return platform;
    }
    else {
        return  @"";
    }
}
/**
 *   当找不到键值对不对应的情况的时候不处理的方法
 *
 *  @param value 值
 *  @param key   键
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

//#pragma mark -- uuid in keychain
//-(NSString *)keychainUUID{
//    if (!_storedUUID) {
//        _storedUUID = [self readUUID];
//    }
//
//    return _storedUUID;
//}
//-(NSString *)readUUID{
//    static NSString *UUID_KEYCHAIN_SERVICE = @"uuid_keychain_service";
//    static NSString *UUID_KEYCHAIN_ACCOUNT = @"uuid_keychain_account";
//    NSString *oldUUID = [SAMKeychain passwordForService:UUID_KEYCHAIN_SERVICE account:UUID_KEYCHAIN_ACCOUNT];
//    if (oldUUID.length) {
//        return oldUUID;
//    }
//
//    NSString *appUUID = [UIDevice currentDevice].identifierForVendor.UUIDString;
//    [SAMKeychain setPassword:appUUID forService:UUID_KEYCHAIN_SERVICE account:UUID_KEYCHAIN_ACCOUNT];
//    return appUUID;
//}

@end
