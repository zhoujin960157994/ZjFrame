//
//  BaseTableViewController.m
//  GpsTracker
//
//  Created by Xu Wei on 15/6/1.
//  Copyright (c) 2015年 Liuhao. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    MBProgressHUD * _HUD;
    NSInteger _viewLocks;
    NSLock * _Locker;
}

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Propertys

- (UITableView *)baseTableView {
    if (!_baseTableView) {
        CGRect tableViewFrame = self.view.bounds;
        tableViewFrame.size.height -= (self.navigationController.viewControllers.count > 1 ? 40 : (CGRectGetHeight(self.tabBarController.tabBar.bounds))) + [self getAdapterHeight]+25;
        _baseTableView = [[UITableView alloc] initWithFrame:tableViewFrame style:self.tableViewStyle];
        _baseTableView.backgroundColor = UIColorFromRGB(0xeeeeee);
        _baseTableView.delegate = self;
        _baseTableView.dataSource = self;
        _baseTableView.bounces = YES;
        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _baseTableView;
}

- (CGFloat)getAdapterHeight {
    CGFloat adapterHeight = 0;
    if ([[[UIDevice currentDevice] systemVersion] integerValue] < 7.0) {
        adapterHeight = -20;
    }
    return adapterHeight;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // in subClass
    return nil;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark --
#pragma mark -- 提示相关
- (void)showMessageAtView:(UIView *)view
                    Title:(NSString*)title
                  Content:(NSString *)content
                     Mode: (MBProgressHUDMode)mode
                     Stay:(float)seconds {
    
    _HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _HUD.mode = mode;
    _HUD.labelText = title;
    _HUD.detailsLabelText = content;
    [_HUD hide:YES afterDelay:seconds];
    
    
    
}
#pragma mark -- 加锁并缓冲提示
- (void)initAndAddViewLock {
    
    [_Locker lock];
    _viewLocks = 0;
    _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _viewLocks += 1;
    [_Locker unlock];
    
}
#pragma mark -- 初始化加锁并缓冲提示
- (void)addViewLock {
    
    if(_viewLocks == 0) {
        _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_Locker lock];
        _viewLocks +=1;
        [_Locker unlock];
    }
}

/**
 *  清除视图上的所有_HUD
 *
 *  @param view 视图，可选控制器view或者一个window对象
 */
- (void)checkDeleteViewLockAtView:(UIView*)view {
    
    [_Locker lock];
    
    _viewLocks -= 1;
    
    [_Locker unlock];
    
    if(_viewLocks <=0) {
        
        [_HUD hide:YES];
        
        for(id view in self.view.subviews) {
            
            if([[view class] isSubclassOfClass:_HUD.class]) {
                
                [view removeFromSuperview];
                
            }
        }
    }
}





- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.tableView touchesBegan:touches withEvent:event];
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

@end
