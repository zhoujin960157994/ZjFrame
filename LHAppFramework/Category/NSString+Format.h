//
//  NSString+Format.h
//  GpsTracker
//
//  Created by Liuhao on 15/4/7.
//  Copyright (c) 2015年 Liuhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Format)

-(BOOL)isValidateEmail;         //验证邮箱合法性
-(BOOL)isValidatePassword;      //验证密码合法性


//验证追踪器编号
- (BOOL)isValidateTrackerNumberWithTrackerNumber:(NSString * )trackerNumber;

+ (BOOL)isValidateTrackerNumberWithTrackerNumber:(NSString *)trackerNumber;
//由追踪器序列号得到绑定类型
+ (NSString *)identifyProductTypeFromTrackerNumber:(NSString *)trackerNumber;
//验证Sim卡号

+ (BOOL)isValidateSimNumber:(NSString *)String;
//验证手机号
+ (BOOL)isValidateMobileNumber:(NSString *)mobileNum;

@end
