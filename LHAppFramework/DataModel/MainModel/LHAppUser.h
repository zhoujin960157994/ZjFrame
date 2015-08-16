//
//  LHAppUser.h
//  LHAppFramework
//
//  Created by lyleKP on 15/8/1.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseDataModel.h"
#import "JsonResultReciver.h"


typedef void(^successBlock)( JsonResultReciver* operation,id responseObject) ;

typedef void(^failureBlock) (NSError * errorr);

@interface LHAppUser : BaseDataModel

@property (nonatomic,strong)NSString * userName;
@property (nonatomic,strong)NSString * password;



/**
 *  单例模式，使得此模型可以保存一些数据
    共享用户数据和方法
 *
 *  @return self
 */
+ (instancetype) shareInstance;



/**
 *  网络请求接口
 */


- (void)requestWithApiName:(JsonClassMethod)aMethod ;


@end
