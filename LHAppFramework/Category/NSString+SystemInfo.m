//
//  NSString+SystemInfo.m
//  GpsTracker
//
//  Created by Liuhao on 15/3/31.
//  Copyright (c) 2015年 Liuhao. All rights reserved.
//

#import "NSString+SystemInfo.h"

@implementation NSString (SystemInfo)

//JSON请求用
+(NSString *) stringWithSystemLanguageForAPI
{
    NSString* preferredLang = [NSString getPreferredLang];
    
    if ([preferredLang isEqualToString:@"zh-Hans"])
    {
        return @"zh-cn";
    }
    else if([preferredLang isEqualToString:@"zh-Hant"])
    {
        return @"zh-hk";
    }
    else
    {
        return @"en-us";
    }
}

+(ProductArea) getProductArea
{
    NSString* preferredLang = [NSString getPreferredLang];
    
    if ([preferredLang isEqualToString:@"zh-Hans"])
    {
        return kProductArea_China;
    }
    else if([preferredLang isEqualToString:@"zh-Hant"])
    {
        return kProductArea_HongKong;
    }
    else
    {
        return kProductArea_ForeignArea;
    }
}

+(NSString *) getPreferredLang
{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    
    return preferredLang;
}



@end
