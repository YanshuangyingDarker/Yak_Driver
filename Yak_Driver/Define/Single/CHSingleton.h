//
//  CHSingleton.h
//  Numerous
//
//  Created by Darker on 2017/11/28.
//  Copyright © 2017年 Charlie. All rights reserved.
//

// .h文件
#define CHSingletonH + (instancetype)sharedInstance;

// .m文件
#define CHSingletonM \
static id _instace; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
}
