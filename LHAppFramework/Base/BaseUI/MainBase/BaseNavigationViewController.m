//
//  BaseNavigationViewController.m
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "UIView+Extension.h"
#import "LHColorDefine.h"
#import "LHAboutMeViewController.h"
#import "UIViewController+RESideMenu.h"
@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController


+ (void)initialize {
    
    UINavigationBar * naviBar = [UINavigationBar appearance] ;
    
    [naviBar setBarTintColor: [UIColor colorWithRed:255/255.0 green:93/255.0 blue:41/255.0 alpha:1]];
    
    NSMutableDictionary * textNomalAttributesDic = [[NSMutableDictionary alloc] init];
    
    textNomalAttributesDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textNomalAttributesDic[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    
    [naviBar setTitleTextAttributes:textNomalAttributesDic];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


/**
 *  重写导航栏控制push方法,重写此方法对控制器没有“侵入性”
 *
 *  @param viewController 拦截调用此方法的控制器，并对其进行设置
 */


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

        if(self.viewControllers.count >0) {//所有根控制器的下一级控制器的导航栏左右两侧按钮样式一致
            
            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"naviBarBack" selectedImage:@"naviBarBack_h"];

            viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:viewController action:@selector(back) image:@"naviBarRight" selectedImage:@"naviBarRight_h"];
            viewController.hidesBottomBarWhenPushed = YES;
       
        }
    [super pushViewController:viewController animated:animated];
    
    
}


- (void)back {
    NSLog(@"navigationController");
    
    [self popViewControllerAnimated:YES];
}



@end
