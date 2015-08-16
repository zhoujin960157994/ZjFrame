//
//  UIButton+Bounds.m
//  LeBaDriver
//
//  Created by Xu Wei on 14-8-26.
//  Copyright (c) 2014年 qiangao. All rights reserved.
//

#import "UIView+Bounds.h"

@implementation UIView (Bounds)

-(void) setBoundWidth:(float) width cornerRadius:(float) radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = [[UIColor lightGrayColor]CGColor];
}

-(void) setBoundWidth:(float) width cornerRadius:(float) radius boardColor:(UIColor *)color
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];
}


@end
