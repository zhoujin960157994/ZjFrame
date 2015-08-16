//
//  AppDelegate.h
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,assign)BOOL inNightMode;
+ (AppDelegate *)shareAppDelegate;

/**
 *  进入接口测试界面
 */
- (void)goToTestPage ;



@end

