//
//  UIBarButtonItem+Extension.m
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

#import "UIView+Extension.h"// 使得size结构体可以直接被赋值

@implementation UIBarButtonItem (Extension)


/**
 *  返回一个设置好了图片和事件对象的UIBarButtonItem
 *
 *  @param target        事件拥有者
 *  @param action        事件名
 *  @param image         正常状态的图片
 *  @param selectedImage 选中状态的图片
 *
 *  @return  返回一个设置好了图片和事件对象的UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target
                             action:(SEL)action
                              image:(NSString *)image
                      selectedImage:(NSString *)selectedImage {
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end


