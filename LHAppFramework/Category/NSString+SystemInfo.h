//
//  NSString+SystemInfo.h
//  GpsTracker
//
//  Created by Liuhao on 15/3/31.
//  Copyright (c) 2015年 Liuhao. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ProductArea){
    kProductArea_China = 1,         //国内配置
    kProductArea_HongKong = 2,      //香港配置
    kProductArea_ForeignArea = 3,   //国外配置
};

@interface NSString (SystemInfo)

+(NSString *) stringWithSystemLanguageForAPI;
//获取产品地域，根据客户选择语言判断
+(ProductArea) getProductArea;

@end
