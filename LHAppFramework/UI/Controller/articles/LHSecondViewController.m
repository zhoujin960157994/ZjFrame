//
//  LHSecondViewController.m
//  LHAppFramework
//
//  Created by lyleKP on 15/8/1.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "LHSecondViewController.h"

@interface LHSecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *testTextField;
@property (weak, nonatomic) IBOutlet UITextField *testTextField2;

@property (weak, nonatomic) IBOutlet BaseScrollView *scrollView;

@end

@implementation LHSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /**
     *  此步骤不可遗漏
     */
     self.testTextField.delegate =self;
    self.testTextField2.delegate = self;
     _baseScrollView = _scrollView;
    
    //设置导航栏右侧按钮样式
   

    self.navigationItem.leftBarButtonItem = nil;
   
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem  itemWithTarget:self action:@selector(btnSearch) image:@"aboutMeNaviRight_n" selectedImage:@"aboutMeNaviRight_h"];
    

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnSearch {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
