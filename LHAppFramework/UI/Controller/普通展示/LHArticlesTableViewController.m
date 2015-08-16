//
//  LHArticlesTableViewController.m
//  LHAppFramework
//
//  Created by lyleKP on 15/8/6.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//
#import "LHMarketButtonCell.h"
#import "LHRecommendProductCell.h"
#import "LHArticlesTableViewController.h"
#import "LHSecondViewController.h"
#import "UIButton+LHCreate.h"
@interface LHArticlesTableViewController ()
{
    MBProgressHUD * _HUD;
    NSInteger _viewLocks;
    NSLock * _Locker;
}


@end

@implementation LHArticlesTableViewController


- (instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _currentUser =[LHAppUser shareInstance];
    
    _currentUser.modelDelegate =self;
    
    [_currentUser requestWithApiName:self.classMethod];
    
    self.baseTableView.delegate =self;
    self.baseTableView.dataSource =self;
    [self.view addSubview:self.baseTableView];
    
    [self initAndAddViewLock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViewControllerWithProducts:(NSArray *)productNameAry buttonImages:(NSArray *)imageNameAry requestMethod:(JsonClassMethod)classMethod {
    
    self.productNameAry = productNameAry;
    self.imageNameAry =imageNameAry;
    
    self.classMethod =classMethod;
}



#pragma mark -- UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    if(section==0) return 100;
    else if(section ==1) return 200;
    else  return 240;
    
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(section==0) return 1;
    else if(section ==1) return 1;
    else  return _recommendProductModelAry.count/2;
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    
    if(section==0) {//循环广告
        
        static NSString *ID = @"cell1";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if(!cell ) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:ID];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"循环广告%ld",indexPath.row];
        return cell;
        
        
    } else if(section ==1) {//8个按钮
        
        LHMarketButtonCell *cell = [[LHMarketButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        
        cell.btnDelegate = self;
        
        [cell initButtonLayOutWithProductNameAry:self.productNameAry ImageNameAry:self.imageNameAry];
        
        return cell;
        
    } else {//8个推荐商品
        
        static NSString *ID = @"LHRecommendProductCell";
        
        LHRecommendProductCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        if(!cell ) {
            
            cell = [[LHRecommendProductCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:ID];
        }
        
        [cell initLayoutWithData:_recommendProductModelAry atIndexPath:indexPath];
        
        return cell;
    }
    
    return nil;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LHSecondViewController * vc = [[LHSecondViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

#pragma mark --
#pragma mark -- DataModelUpdateDelegate

- (void)didUpdateResource:(id)resource jsonClassMethod:(JsonClassMethod)jsonClassmethod errorMessage:(NSString *)errorMessage errorCode:(NSInteger)errorCode {
    
    [self checkDeleteViewLockAtView:self.view];
    
    if(jsonClassmethod == self.classMethod ) {
        
        
        _recommendProductModelAry = [NSArray arrayWithArray:(NSArray *)resource];
        
        [self.baseTableView reloadData];
        
    }
    
    
}

#pragma mark -- LH_SendButtonClickedMessage

-(void)sendButtonClickedMessage:(UIButton *)button {
    
    NSLog(@"接收点击");
    
    
}



@end
