//
//  SWCrashReport.m
//  iOS-oc-wechat
//
//  Created by winter on 16/2/3.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWCrashReport.h"
@implementation SWCrashReport

kSWStrictSingletonForClass(SWCrashReport)

+ (void) registerCrashReport {
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];//得到当前调用栈信息
    NSString *reason = [exception reason];//非常重要，就是崩溃的原因
    NSString *name = [exception name];//异常类型
    
    NSString *crashLogInfo = [NSString stringWithFormat:@"程序崩溃信息 \n 异常类型 : %@ \n 崩溃原因 : %@ \n 调用栈信息 : %@", name, reason, arr];
    sendEmailCrashMessage(crashLogInfo);
    
}

#pragma mark - 直接跳到系统的发送邮件功能
void sendEmailCrashMessage(NSString *crashLogInfo) {
    //获取用户是否设置了邮件账户：
    NSString *urlStr = [NSString stringWithFormat:@"mailto://578595193@qq.com?subject=bug报告&body=感谢您的配合! 错误详情:%@",crashLogInfo];
    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @YES};
    [[UIApplication sharedApplication] openURL:url options:options completionHandler:NULL];
}




@end
