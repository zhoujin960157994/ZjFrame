//
//  KPRecommendProductModel.h
//  Kuparts
//
//  Created by myMac on 15-1-4.
//  Copyright (c) 2015年 Kuparts.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDataModel.h"
@interface KPRecommendProductModel :BaseDataModel


@property (nonatomic, retain) NSString *oldPrice;

@property (nonatomic, retain) NSString *imgUrlStr;

@property (nonatomic, retain) NSString *price;

@property (nonatomic, retain) NSString *nameStr;

@property (nonatomic, retain) NSString *idStr;

@property (nonatomic, retain) NSString *shopID;



- (void)handleDataAndSendToViewController ;


@end
