//
//  NSDictionary+NotNullValue.m
//  GasStation
//
//  Created by Xu Wei on 14-5-28.
//  Copyright (c) 2014年 qiangao. All rights reserved.
//

#import "NSDictionary+NotNullValue.h"

@implementation NSDictionary (NotNullValue)

-(id) getNotNullValue:(NSString *) name
{
    if((NSNull *) [self valueForKey:name] != [NSNull null])
    {
        id temp = [self valueForKey:name];
        if([temp isKindOfClass:[NSString class]])
        {
            if([temp isEqualToString:@"null"])
                return @"";
            else if ([temp isEqualToString:@""])
                return nil;
            
        }
        
        return [self valueForKey:name];
    }
    
    return nil;
}

@end
