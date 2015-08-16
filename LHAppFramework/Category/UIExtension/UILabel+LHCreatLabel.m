//
//  UILabel+LHCreatLabel.m
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "UILabel+LHCreatLabel.h"

@implementation UILabel (LHCreatLabel)




/**
 *  商品活着服务描述标签
 *
 */
+ (UILabel *)lh_descriptionLabelFrame:(CGRect)frame
                               String:(NSString *) aStr {
    
    UILabel * label =[UILabel new];
    
    [label setFrame:frame];
    label.text = aStr;
    [label setTextColor:[UIColor grayColor]];
    label.numberOfLines = 2;
    label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(11.0)];
    return label;
}

/**
 *  价格标签
 
 */
+ (UILabel *)lh_priceLabelFrame:(CGRect)frame
                         String:(NSString *) aStr {
    
    UILabel * label =[UILabel new];
    [label setFrame:frame];
    label.text = aStr;
    [label setTextColor:[UIColor orangeColor]];
    label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(15.0)];
    return label;
    
}
/**
 *  原价标签
 
 */

+ (UILabel *)lh_oldPriceLabelFrame:(CGRect)frame
                        WithString:(NSString *) aStr {
    
    UILabel * label =[UILabel new];
    [label setFrame:frame];
    label.text = aStr;
    [label setTextColor:[UIColor lightGrayColor]];
    label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(13.0)];
    return label;
    
}




@end
