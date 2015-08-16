//
//  NSString+Date.m
//  LeBaDriver
//
//  Created by Xu Wei on 14-7-28.
//  Copyright (c) 2014年 qiangao. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

+(NSString *) stringWithJsonDate:(NSDate *)date
{
    NSDateFormatter *dayFormat = [[NSDateFormatter alloc]init];
    dayFormat.dateFormat = @"yyyy-MM-dd";
    NSString *strDay = [dayFormat stringFromDate:date];
    NSLog(@"strDay:%@",strDay);
    
    return strDay;
}

@end
