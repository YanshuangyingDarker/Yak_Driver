//
//  CHOrderModel.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#import "XHModel.h"

@interface CHOrderModel : XHModel

XHProperty(NSString *placeName, placeName);
XHProperty(NSString *startTime, startTime);
XHProperty(NSString *endTime, endTime);
XHProperty(NSString *travelName, travelName);
XHProperty(NSString *isRecive, isRecive);
XHProperty(NSString *orderPhone, orderPhone);
//XHProperty(<#Property#>, <#MapName#>)

@end
