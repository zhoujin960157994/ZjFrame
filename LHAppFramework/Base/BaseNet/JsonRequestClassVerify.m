//
//  JsonRequestClassVerify.m
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "JsonRequestClassVerify.h"


#define kURL_PREFIX  @"http://api1.kuparts.com/api/"



@implementation JsonRequestClassVerify


+(NSString *) getClassName:(JsonClassName) cn
{
    switch (cn) {
        case kClassName_None:
            return nil;
            break;
        case kClassName_KP_Business:
            return @"KuPaiBusiness";
            break;
            
        default:
            return nil;
            break;
    }
}

+(NSString *) getClassMethod:(JsonClassMethod) cm
{
    switch (cm) {
        case kClassName_None:
            return nil;
            break;

        case kClassName_Reccommended:
            return [NSString stringWithFormat:@"%@AppPros?type=1",kURL_PREFIX];
            break;
        case kClassMethod_Market:
            return [NSString stringWithFormat:@"%@AppPros?type=2",kURL_PREFIX];
            
            break;
        case kClassMethod_CarArticls:
            return [NSString stringWithFormat:@"%@AppPros?type=3",kURL_PREFIX];
            break;
        case kClassMethod_Serverce:
            return [NSString stringWithFormat:@"%@AppPros?type=3",kURL_PREFIX];
            break;
            
        default:
            return nil;
            break;
    }
}

@end
