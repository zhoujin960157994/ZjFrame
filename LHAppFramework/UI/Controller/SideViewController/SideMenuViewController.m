//
//  SideMenuViewController.m
//  iosapp
//
//  Created by chenhaoxiang on 1/31/15.
//  Copyright (c) 2015 oschina. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SwipableViewController.h"
#import "LHSecondViewController.h"
#import "Utils.h"
#import "RESideMenu.h"
#import "UIView+Extension.h"
#import "AppDelegate.h"


@interface SideMenuViewController ()

@property (nonatomic, strong) UIViewController *reservedViewController;


@end

@implementation SideMenuViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    


}

- (void)dawnAndNightMode:(NSNotification *)center
{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 160;
}

/**
 *  添加头像自定义视图
 *
 *  @param tableView
 *  @param section
 *
 *  @return
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *portraitView = [UIImageView new];
    portraitView.contentMode = UIViewContentModeScaleAspectFit;
    [portraitView setCornerRadius:30];
    portraitView.userInteractionEnabled = YES;
    
    portraitView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [headerView addSubview:portraitView];
    
    portraitView.image = [UIImage imageNamed:@"default－portrait"];
 
    UILabel *nameLabel = [UILabel new];
    
    nameLabel.text = @"车主名字";
    
    nameLabel.font = [UIFont boldSystemFontOfSize:20];

    nameLabel.textColor = [UIColor colorWithHex:0x696969];

    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [headerView addSubview:nameLabel];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(portraitView, nameLabel);
    
    NSDictionary *metrics = @{@"x": @([UIScreen mainScreen].bounds.size.width / 4 - 15)};
    
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[portraitView(60)]-10-[nameLabel]-15-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
    
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-x-[portraitView(60)]" options:0 metrics:metrics views:views]];
    
    portraitView.userInteractionEnabled = YES;
    
    nameLabel.userInteractionEnabled = YES;
    
    [portraitView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushLoginPage)]];
    [nameLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushLoginPage)]];
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewCell *cell = [UITableViewCell new];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.text = @"菜单";
    
        return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LHSecondViewController * sec  =[[ LHSecondViewController alloc] init];
    
    sec.view.backgroundColor = LHRandomColor;
    
    switch (indexPath.row) {
        case 0: {
            LHSecondViewController *newsSVC = [[LHSecondViewController alloc] init];
            
            [self setContentViewController:newsSVC];
            
            break;
        }
        case 1: {
            LHSecondViewController *newsSVC = [[LHSecondViewController alloc] init];
            
            [self setContentViewController:newsSVC];
            
            break;
        }

        default: break;
    }
}
/**
 *  导航打开侧边栏按钮选项
 *
 *  @param viewController
 */
- (void)setContentViewController:(UIViewController *)viewController
{
    viewController.hidesBottomBarWhenPushed = YES;
    
    UINavigationController *nav = (UINavigationController *)((UITabBarController *)self.sideMenuViewController.contentViewController).selectedViewController;
    
    //UIViewController *vc = nav.viewControllers[0];
    //vc.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    [nav pushViewController:viewController animated:NO];
    
    [self.sideMenuViewController hideMenuViewController];
}


- (void)pushLoginPage {
    
    
}

@end
