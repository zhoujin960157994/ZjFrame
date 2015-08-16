//
//  JsonRequestClassVerify.h
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseDataModel.h"




@interface JsonRequestClassVerify : NSObject


+(NSString *) getClassName:(JsonClassName) cn;

+(NSString *) getClassMethod:(JsonClassMethod) cm;



@end
