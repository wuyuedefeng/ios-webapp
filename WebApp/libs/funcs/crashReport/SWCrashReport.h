//
//  SWCrashReport.h
//  iOS-oc-wechat
//
//  Created by winter on 16/2/3.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWCrashReport : NSObject

+ (SWCrashReport *)sharedSWCrashReport;

+ (void) registerCrashReport;

@end
