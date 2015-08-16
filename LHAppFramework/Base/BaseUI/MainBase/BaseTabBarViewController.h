//
//  BaseTabBarViewController.h
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHColorDefine.h"
#import "SwipableViewController.h"



@interface BaseTabBarViewController : UITabBarController



- (void)addChildViewController:(UIViewController *)viewController
andSetUpTabbarOfViewControllerWithTitle:(NSString *)title
                      andImage:(NSString *)imageName
              annSelectedImage:(NSString * )selectedImageName;




@end
