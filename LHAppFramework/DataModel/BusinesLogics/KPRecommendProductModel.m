//
//  KPRecommendProductModel.m
//  Kuparts
//
//  Created by myMac on 15-1-4.
//  Copyright (c) 2015年 Kuparts.com. All rights reserved.
//

#import "KPRecommendProductModel.h"

@implementation KPRecommendProductModel



- (void)handleDataAndSendToViewController  {
    
    
    NSString * str = @"新消息";
    
    [self.modelDelegate didUpdateResource:str jsonClassMethod:kClassMethod_CarArticls errorMessage:nil errorCode:0];
}
@end
