//
//  NSString+Format.m
//  GpsTracker
//
//  Created by Liuhao on 15/4/7.
//  Copyright (c) 2015年 Liuhao. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)

-(BOOL)isValidateEmail
{
    NSString *emailRegex = @"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(BOOL)isValidatePassword      //验证密码合法性
{
    if(self.length >=8 && self.length<=20)
        return YES;
    return NO;
}

+ (BOOL)isValidateTrackerNumberWithTrackerNumber:(NSString *)trackerNumber
{

    if(trackerNumber.length!=12)
    {
        return NO;
        
    }
    
    return YES;
}


// 正则判断手机号码地址格式
+ (BOOL)isValidateMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestphs evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

//判断SIM卡号
+ (BOOL)isValidateSimNumber:(NSString *)String
{
    for(int i=0; i< [String length];i++){
        
        int a = [String characterAtIndex:i];
        
        if( a > 0x4e00 && a < 0x9fff)
            
            return true;
        
    }
    return false;
}
//判断追踪器序列号返回可绑定类型
+ (NSString *)identifyProductTypeFromTrackerNumber:(NSString *)trackerNumber
{

    
    NSString * identifyStr=[trackerNumber substringWithRange:NSMakeRange(1,2)];
    NSLog(@"identifyStr:%@",identifyStr);
    
    NSInteger identifyNumber = [identifyStr integerValue];
    
    if(identifyNumber == 01 || identifyNumber ==02|| identifyNumber ==06)
    {
        return @"1";
    }
    else if(identifyNumber == 05 || identifyNumber ==11 || identifyNumber ==13)
    {
        return @"2";
    }
    else if(identifyNumber == 03 || identifyNumber ==12)
    {
        return @"4";
    }
    else if(identifyNumber == 04 )
    {
        return @"3";
    }
    
    return nil;
}
@end
