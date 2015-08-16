//
//  JsonResultReciver.m
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "JsonResultReciver.h"
#import "NSDictionary+NotNullValue.h"


@implementation JsonResultReciver


-(instancetype) initWithJsonData:(NSDictionary *) data
{
    NSDictionary *dic = data;
    
    self = [super init];
    if(self)
    {
        _code = [[dic getNotNullValue:@"code"]integerValue];
        
        _what = [dic getNotNullValue:@"what"];
        _dic = [dic getNotNullValue:@"ret"];
    }
    
    return self;
}




@end
