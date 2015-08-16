//
//  LHHomesViewController.m
//  LHAppFramework
//
//  Created by lyleKP on 15/8/1.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "LHHomesViewController.h"

@interface LHHomesViewController ()

- (IBAction)test1:(id)sender;
- (IBAction)test2:(id)sender;
- (IBAction)test3:(id)sender;
- (IBAction)test4:(id)sender;
- (IBAction)test5:(id)sender;

- (IBAction)goToTestPage:(id)sender;

@end

@implementation LHHomesViewController




#pragma mark--
#pragma mark-- life cycle method


- (void)viewDidLoad {
        
        [super viewDidLoad];
        
        _currentUser = [LHAppUser shareInstance];
        
//        [_currentUser registerUser];
    
        _currentUser.modelDelegate = self;
    
}
/**
 *  如果想覆盖父类中设置不成功
 *  可以将设置写在子类的 iewWillAppear 方法中
 *  @param animated
 */
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = LHRandomColor;

}



-(void)didUpdateResource:(id)resource jsonClassMethod:(JsonClassMethod)jsonClassmethod errorMessage:(NSString *)errorMessage errorCode:(NSInteger)errorCode {
        
        
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)test1:(id)sender {
    [self showMessageAtView:self.view Title:@"提示" Content:@"请求失败" Mode:MBProgressHUDModeText Stay:1.5];
}

- (IBAction)test2:(id)sender {
    
[self showMessageAtView:self.view Title:@"正在登录" Content:nil  Mode:MBProgressHUDModeDeterminate Stay:1.5];
    

    
}

- (IBAction)test3:(id)sender {
    
    [self initAndAddViewLock];
    [self performSelector:@selector(test5:) withObject:nil afterDelay:0.5];
}

- (IBAction)test4:(id)sender {
    
    [self addViewLock];
    [self performSelector:@selector(test5:) withObject:nil afterDelay:0.5];
}


- (IBAction)test5:(id)sender {
    
    [self checkDeleteViewLockAtView:self.view];
}



- (IBAction)goToTestPage:(id)sender {
    
    [[AppDelegate shareAppDelegate] goToTestPage];

}


@end
