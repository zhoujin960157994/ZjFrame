//
//  KPRecommendProductModel.h
//  Kuparts
//
//  Created by myMac on 15-1-4.
//  Copyright (c) 2015年 Kuparts.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModelLib.h"
@interface KPRecommendProductModel :JSONModel


@property (nonatomic, strong) NSString *markPrice;

@property (nonatomic, strong) NSString *price;

@property (nonatomic, strong) NSString *img;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *proId;

@property (nonatomic, strong) NSString *shopId;

/**
 *  idStr,
 shopID,
 oldPrice,
 imgUrlStr,
 nameStr
 */




@end
