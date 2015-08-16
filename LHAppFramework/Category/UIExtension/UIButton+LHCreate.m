//
//  UIButton+LHCreate.m
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "UIButton+LHCreate.h"

@implementation UIButton (LHCreate)


+ (UIButton *) lh_creatButton:(CGRect)frame
                     Image:(NSString *)imageName
                     Title:(NSString *)title
                  forState:(UIControlState)stateType {
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    
   UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:frame];
    
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
    
    [button.imageView setContentMode:UIViewContentModeCenter];
    
    [button setImageEdgeInsets:UIEdgeInsetsMake(-8.0,
                                              0.0,
                                              0.0,
                                              -titleSize.width)];
    
    UIImage * image = [UIImage imageNamed:imageName];
    
    [button setImage:image forState:stateType];
    
    [button.titleLabel setContentMode:UIViewContentModeCenter];
    [button.titleLabel setBackgroundColor:[UIColor clearColor]];
    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [button.titleLabel setTextColor:[UIColor redColor]];
    
    [button setTitleEdgeInsets:UIEdgeInsetsMake(70.0,
                                              -image.size.width,
                                              0.0,
                                              0.0)];
    [button setTitle:title forState:stateType];
    
    return button;
}




@end
