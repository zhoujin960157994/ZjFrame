//
//  UIButton+LHCreate.h
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LHCreate)

+ (UIButton *) lh_creatButton:(CGRect)frame
                     Image:(NSString *)imageName
                     Title:(NSString *)title
                  forState:(UIControlState)stateType;


@end
