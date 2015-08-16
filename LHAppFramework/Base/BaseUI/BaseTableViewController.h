//
//  BaseTableViewController.h
//  GpsTracker
//
//  Created by Xu Wei on 15/6/1.
//  Copyright (c) 2015年 Liuhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHColorDefine.h"
#import "MBProgressHUD.h"
@interface BaseTableViewController : UITableViewController

/**
 *  显示大量数据的控件
 */
@property (nonatomic, strong)  UITableView *baseTableView;

/**
 *  初始化init的时候设置tableView的样式才有效
 */
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

/**
 *  大量数据的数据源
 */
@property (nonatomic, strong) NSMutableArray *dataSource;




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
