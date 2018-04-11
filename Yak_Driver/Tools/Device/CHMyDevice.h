//
//  CHMyDevice.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UUID_IN_KEYCHAIN                    [CHMyDevice currentDevice].keychainUUID

@interface CHMyDevice : NSObject

@property(nonatomic,strong) NSString  *appName;
@property(nonatomic,strong) NSString  *deviceName;// e.g. "My iPhone"
@property(nonatomic,strong) NSString  *model;             // e.g. @"iPhone", @"
@property(nonatomic,strong) NSString  *localizedModel;    // localized version of model
@property(nonatomic,strong) NSString  *systemName;        // e.g. @"iOS"
@property(nonatomic,strong) NSString  *systemVersion; // 设备的系统版本号
@property (nonatomic,strong) NSString *version; // 应用版本号
@property (nonatomic,strong) NSString *deviceType; // 应用设备号

@property (nonatomic,copy,readonly) NSString *keychainUUID; //储存于keychain的不变uuid

+ (instancetype)currentDevice;

@end
