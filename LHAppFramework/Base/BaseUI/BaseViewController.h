//
//  BaseViewController.h
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISettingExtention.h"
#import "LHColorDefine.h"
#import "LHAppUser.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "BaseScrollView.h"

@interface BaseViewController : UIViewController<UITextFieldDelegate,DataModelUpdateDelegate>
{
    
    
    LHAppUser * _currentUser;
    
    BaseScrollView * _baseScrollView;
    
    NSLock * _Locker;
    
}

@property (assign, nonatomic)UITextField *currentTextField;

/**
 *  子类可重写此方设置导航栏左右两个按钮
 */
- (void)setUpNaviRightButton;

/**
 *  显示提示或者加载信息
 *
 *  @param view    显示在哪个试图上，，一般为控制器的view，可选uiwindow
 *  @param title   提示标题
 *  @param content 提示内容
 *  @param mode    提示的样式
 *  @param seconds 几秒后移除提示
 */
- (void)showMessageAtView:(UIView *)view
                    Title:(NSString*)title
                  Content:(NSString *)content
                     Mode: (MBProgressHUDMode)mode
                     Stay:(float)seconds;

- (void)checkDeleteViewLockAtView:(UIView*)view;

- (void)addViewLock;

- (void)initAndAddViewLock;




@end
