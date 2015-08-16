//
//  BaseViewController.m
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Extension.h"
#import "UIViewController+RESideMenu.h"
#import "UIBarButtonItem+Extension.h"


#define KEYBOARD_HEIGHT 216

@interface BaseViewController ()
{
    float _keyboardHeight;
    
    BOOL _keyboardIsShow;
    
    MBProgressHUD * _HUD;
    
    NSInteger _viewLocks;
   
}


@end

@implementation BaseViewController

- (instancetype)init {
    
    self = [super init];
    if(self) {
        

    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
         self.view.backgroundColor = LHRandomColor;
        
        _viewLocks = 0;
        
        _Locker = [[NSLock alloc] init];
        
        //监听键盘状态
        
        //升起
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        //落下
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
        
    }
    
    return self;
}
#pragma mark --
#pragma mark -- life cycle method

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpNaviRightButton];
   
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

#pragma mark --
#pragma mark -- 键盘事件处理

- (void)keyboardWillShow:(NSNotification *)aNotification {
    
    if(self.currentTextField == nil) {
        return;
    }
    if(_keyboardIsShow) {
        
        return;
    }
    
    NSDictionary *info = [aNotification userInfo];
    
    NSValue * aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = [self.view convertRect:[aValue CGRectValue] fromView:nil];
    
    CGRect viewFrame = [_baseScrollView frame];
    
    _keyboardHeight = keyboardRect.size.height;
    
//    _keyboardHeight = KEYBOARD_HEIGHT;
    
    viewFrame.size.height -= _keyboardHeight;

    _baseScrollView.frame = viewFrame;
    
    
    CGRect textRect = [self.currentTextField frame];
 
    [_baseScrollView scrollRectToVisible:textRect animated:YES];
    
    _keyboardIsShow = YES;
}

- (void)keyboardWillHidden:(NSNotification*)aNotification{
    
    if(self.currentTextField == nil) {
        return;
    }
    
    
    CGRect viewFrame = [_baseScrollView frame];
    
    viewFrame.size.height  += _keyboardHeight;
    
    _baseScrollView.frame = viewFrame;
    
    _keyboardIsShow = NO;
    
    
}
#pragma mark -- UITextFieldDelegate
/**
 *  获取正在编辑的文本框
 *
 *  @param textField 代理监听到的开始编辑的文本框
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    
    self.currentTextField  = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    self.currentTextField = nil;
    
}



#pragma mark -- 设置左侧和右侧导航栏按钮及事件
/**
 *  设置左侧和右侧导航栏按钮及事件，供子类重载
 */
- (void)setUpNaviRightButton {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(presentLeftMenuViewController:) image:@"naviLeft_n" selectedImage:@"naviLeft_h"];
    
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem  itemWithTarget:self action:@selector(rightBarButtonClicked) image:@"naviSearch_n" selectedImage:@"naviSearch_h"];
}

/**
 *  右侧按钮点击事件，子类重载
 */
- (void)rightBarButtonClicked {
    
    
}


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

#pragma mark --
#pragma mark -- DataModelUpdateDelegate

-(void) didUpdateResource:(id) resource
          jsonClassMethod:(JsonClassMethod) jsonClassmethod
             errorMessage:(NSString *)errorMessage
                errorCode:(NSInteger) errorCode {
    
}

-(void) didFailedRequest:(id) resource
         jsonClassMethod:(JsonClassMethod) jsonClassmethod
            errorMessage:(NSString *)errorMessage
               errorCode:(NSInteger) errorCode {
    
}


#pragma mark --touch 事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.currentTextField== nil) {
        return;
    }
    [self.currentTextField becomeFirstResponder];
    
    [self.currentTextField resignFirstResponder];


}


@end
