//
//  UILabel+LHCreatLabel.h
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LHCreatLabel)

/**
 *  商品活着服务描述标签
 *
 */
+ (UILabel *)lh_descriptionLabelFrame:(CGRect)frame
                               String:(NSString *) aStr ;
/**
 *  价格标签

 */
+ (UILabel *)lh_priceLabelFrame:(CGRect)frame
                         String:(NSString *) aStr ;
/**
 *  原价标签

 */

+ (UILabel *)lh_oldPriceLabelFrame:(CGRect)frame
                        WithString:(NSString *) aStr;


@end
