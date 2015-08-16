//
//  UIView+Extension.h
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//


/**
 *  UIView+Extension 使得frame结构体下的成员属性能被直接赋值
 */




#import <UIKit/UIKit.h>

@interface UIView (Extension)


@property (nonatomic,assign)CGPoint origin;

@property (nonatomic,assign)CGSize size;

@property (nonatomic,assign) CGFloat x;

@property (nonatomic,assign) CGFloat y;

@property (nonatomic,assign) CGFloat width;

@property (nonatomic,assign) CGFloat height;




+ (UIView *)lh_lineViewWithFrame:(CGRect)frame  ;

@end
