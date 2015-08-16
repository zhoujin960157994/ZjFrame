//
//  AppDelegate.m
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "LHAppTestViewController.h"

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "BaseNavigationViewController.h"
#import "BaseTabBarViewController.h"
#import "RESideMenu.h"
#import "SideMenuViewController.h"
@interface AppDelegate ()<RESideMenuDelegate>

@end

@implementation AppDelegate

+ (AppDelegate *)shareAppDelegate {
    
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self loadMainPage];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
#pragma mark --
#pragma mark -- 主界面

- (void)loadMainPage {
    
    BaseTabBarViewController  * tabbarVc = [[BaseTabBarViewController alloc] init];
    
    
    SideMenuViewController*leftMenuViewController = [[SideMenuViewController alloc] init];
    
    leftMenuViewController.view.backgroundColor = [UIColor orangeColor];
    
    
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:tabbarVc
                                                                    leftMenuViewController:leftMenuViewController
                                                                   rightMenuViewController:nil];
    
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"Stars"];
    sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    
    
    
    self.window.rootViewController = sideMenuViewController;
}
#pragma mark -- 接口测试
- (void)goToTestPage {
    LHAppTestViewController * testVc = [[LHAppTestViewController alloc] init];
    
    self.window.rootViewController = testVc;
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
