//
//  JsonResultReciver.h
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseDataModel.h"

@interface JsonResultReciver : BaseDataModel


-(instancetype) initWithJsonData:(NSDictionary *) data;



@property (assign, nonatomic, readonly) NSInteger code;
@property (strong, nonatomic, readonly) NSString *what;
@property (strong, nonatomic, readonly) NSDictionary *dic;




@end
