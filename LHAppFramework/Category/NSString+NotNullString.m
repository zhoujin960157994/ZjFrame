//
//  NSString+NotNullString.m
//  GpsTracker
//
//  Created by Liuhao on 15/4/2.
//  Copyright (c) 2015年 Liuhao. All rights reserved.
//

#import "NSString+NotNullString.h"

@implementation NSString (NotNullString)

-(NSString *) notNullValue
{
    if(self == nil)
        return @"";
    else
        return self;
}

@end
