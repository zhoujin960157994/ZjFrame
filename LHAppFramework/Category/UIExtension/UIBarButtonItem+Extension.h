//
//  UIBarButtonItem+Extension.h
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)



/**
 *  @return 返回一个自定义图片和点击事件的UIBarButtonItem
 */

+ (UIBarButtonItem *)itemWithTarget:(id)target
                             action:(SEL)action
                              image:(NSString *)image
                      selectedImage:(NSString *)selectedImage;


@end
