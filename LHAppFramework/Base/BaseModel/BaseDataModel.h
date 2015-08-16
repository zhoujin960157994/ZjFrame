//
//  BaseDataModel.h
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    kClassName_None = -1,
    kClassName_KP_Business = 100
}JsonClassName;

typedef enum {
    kClassMethod_None = -1,
    
#pragma mark LMAppUser JSON接口
    kClassName_Reccommended = 100,
    kClassMethod_Market,                     
    kClassMethod_CarArticls,
    kClassMethod_Serverce,
    
    
}JsonClassMethod;


@protocol DataModelUpdateDelegate <NSObject>


-(void) didUpdateResource:(id) resource
          jsonClassMethod:(JsonClassMethod) jsonClassmethod
             errorMessage:(NSString *)errorMessage
                errorCode:(NSInteger) errorCode;

-(void) didFailedRequest:(id) resource
         jsonClassMethod:(JsonClassMethod) jsonClassmethod
            errorMessage:(NSString *)errorMessage
               errorCode:(NSInteger) errorCode;


@end


@interface BaseDataModel : NSObject


@property (nonatomic,assign) id <DataModelUpdateDelegate> modelDelegate ;


@end
