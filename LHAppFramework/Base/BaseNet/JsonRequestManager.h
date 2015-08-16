//
//  JsonRequestManager.h
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseDataModel.h"
#import "JsonEvent.h"
#import "AFNetworking.h"


typedef enum {
    kREQUEST_TYPE_NONE = -1,
    kREQUEST_TYPE_POST = 1,
    kREQUEST_TYPE_GET = 2,
    kREQUEST_TYPE_PUT = 3,
    kREQUEST_TYPE_POSTIMAGE = 4,
    
}REQUEST_TYPE;

@class JsonRequestParameters;

@interface JsonRequestManager : BaseDataModel
{
    BOOL _bReSendCmd;
    
    JsonRequestParameters *_lastCmd;
    
    void (^lastSuccBlock)(id responseObject);
    
    void (^lastFailedBlock)(NSError *error);
    
}


- (void) requestWithParameters:(JsonRequestParameters *) parameters
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure ;



+(id) shareInstance ;


-(void) clearSelf ;


@end



@interface JsonRequestParameters : BaseDataModel

@property (strong, nonatomic) NSString *urlPath;

@property (assign, nonatomic) REQUEST_TYPE requestType;

@property (strong, nonatomic) NSDictionary *parameters;

@property (assign, nonatomic) JsonClassMethod method;

@property (strong, nonatomic) NSData *imageData;

@property (strong,nonatomic)NSDictionary * postDic ;



@end