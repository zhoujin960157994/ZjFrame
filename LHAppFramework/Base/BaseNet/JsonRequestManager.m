//
//  JsonRequestManager.m
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "JsonRequestManager.h"
#import "JsonRequestClassVerify.h"
#import "JSErrors.h"
#import "NSString+SystemInfo.h"


@implementation JsonRequestManager

static JsonRequestManager *jsonRequest_;
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void) clearSelf
{
    jsonRequest_ =  nil;
}

+(id) shareInstance
{
    if(!jsonRequest_)
    {
        jsonRequest_ = [[JsonRequestManager alloc]init];
    }
    
    return jsonRequest_;
}


-(void) requestWithParameters:(JsonRequestParameters *) jsParameters
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure
{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //指定为JSON格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:[NSString stringWithSystemLanguageForAPI] forHTTPHeaderField:@"Accept-Language"];
    
    
    if(jsParameters.requestType == kREQUEST_TYPE_GET) {
        
        NSDictionary *dict = @{@"format": @"json"};
        
        [manager GET:jsParameters.urlPath parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            failure(error);
            
        }];
        
    } else {
        NSMutableDictionary *postParam = [[NSMutableDictionary  alloc] initWithDictionary:jsParameters.postDic];
        
        [postParam setValue:[JsonRequestClassVerify getClassMethod:jsParameters.method] forKey:@"function"];
        
        NSLog(@"上传参数:%@",postParam);
        
        [manager POST:jsParameters.urlPath parameters:postParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"\n--------------------\nAFN请求＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝        成功      ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝,successBlock回调中。。。。。。。");
            
            success(responseObject);
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"\n--------------------\nAFN请求＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝       失败      ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝,failureBlock回调中。。。。。。。");
            failure(error);
            
        }];
    }
    
    
    
    
    
}

@end


@implementation JsonRequestParameters

- (instancetype)init
{
    self = [super init];
    if (self) {
        _requestType = kREQUEST_TYPE_NONE;
    }
    return self;
}


@end
