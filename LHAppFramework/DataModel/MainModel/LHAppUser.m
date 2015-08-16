//
//  LHAppUser.m
//  LHAppFramework
//
//  Created by lyleKP on 15/8/1.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "LHAppUser.h"

#import "JsonRequestManager.h"
#import "JsonRequestClassVerify.h"
#import "JsonResultReciver.h"
#import "KPRecommendProductModel.h"

#import "JSONModelLib.h"

static LHAppUser * _currentUser;

@implementation LHAppUser


+ (instancetype)shareInstance {
    
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        
        _currentUser = [[LHAppUser alloc] init];
        
    });
    return _currentUser;
}

#pragma mark -- lh -07.30 注册
- (void)registerUser {
    
    JsonRequestParameters * parameter = [[JsonRequestParameters alloc] init];
    
    parameter.urlPath = @"http://api1.kuparts.com/api/appad?phRange=2-5";
    
    parameter.requestType = kREQUEST_TYPE_GET;
    
//    parameter.method = kClassMethod_Register;
    
    [[JsonRequestManager shareInstance] requestWithParameters:parameter success:^(id responseObject) {
        
//        NSLog(@"%@",responseObject);
        
        [self.modelDelegate didUpdateResource:responseObject jsonClassMethod:0 errorMessage:nil errorCode:100];
        
    } failure:^(NSError *error) {
        
        
    }];
}


#pragma mark -- lh -07.30 登陆
- (void)loginOnServer {
    JsonRequestParameters * parameter = [[JsonRequestParameters alloc] init];
    
    parameter.urlPath = @"http://api1.kuparts.com/api/appad?phRange=2-5";
//    parameter.method = kClassMethod_UserLogin;
    parameter.requestType = kREQUEST_TYPE_GET;
    
    [[JsonRequestManager shareInstance] requestWithParameters:parameter success:^(id responseObject) {
        
//        NSLog(@"%@",responseObject);
        
    } failure:^(NSError *error) {
        
        
    }];
    
}
#pragma mark -- lh -07.30 用品
- (void)requestRecommendedCarArticles  {
    
    
    JsonRequestParameters * parameter = [[JsonRequestParameters alloc] init];
    
    parameter.urlPath = @"http://api1.kuparts.com/api/AppPros?type=3";
    
    parameter.method =kClassMethod_CarArticls;
    
    parameter.requestType = kREQUEST_TYPE_GET;
    
    [[JsonRequestManager shareInstance] requestWithParameters:parameter success:^(id responseObject) {
        
        
        
//        JsonResultReciver * jsonResult = [[JsonResultReciver alloc] initWithJsonData:responseObject];
        
        
        NSArray * modelAry = [KPRecommendProductModel arrayOfModelsFromDictionaries:responseObject];
        
        [self.modelDelegate didUpdateResource:modelAry jsonClassMethod:parameter.method errorMessage:@"" errorCode:0];
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
}




- (void)requestWithApiName:(JsonClassMethod) method {
    
    
    JsonRequestParameters * parameter = [[JsonRequestParameters alloc] init];
    
    NSString *urlStr =[JsonRequestClassVerify getClassMethod:method];
    parameter.urlPath = urlStr ;
    
    
    parameter.method =method;
    
    parameter.requestType = kREQUEST_TYPE_GET;
    
    [[JsonRequestManager shareInstance] requestWithParameters:parameter success:^(id responseObject) {
        
        
        
        //        JsonResultReciver * jsonResult = [[JsonResultReciver alloc] initWithJsonData:responseObject];
        
        
        NSArray * modelAry = [KPRecommendProductModel arrayOfModelsFromDictionaries:responseObject];
        
        
        [self.modelDelegate didUpdateResource:modelAry jsonClassMethod:parameter.method errorMessage:nil errorCode:0];
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
}




@end
