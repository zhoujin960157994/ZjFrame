//
//  LHArticlesTableViewController.h
//  LHAppFramework
//
//  Created by lyleKP on 15/8/6.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//
#import "LHAppUser.h"
#import "MBProgressHUD.h"
#import "UIBarButtonItem+Extension.h"
#import "BaseTableViewController.h"

@interface LHArticlesTableViewController : BaseTableViewController <DataModelUpdateDelegate>
{
    
    LHAppUser * _currentUser;
}

@property (nonatomic,copy) NSArray * recommendProductModelAry;


@property (nonatomic,strong) NSArray * productNameAry;

@property (nonatomic,strong) NSArray * imageNameAry ;

@property (nonatomic,assign) JsonClassMethod classMethod;

- (void)initViewControllerWithProducts:(NSArray*)productNameAry
                          buttonImages:(NSArray*)imageNameAry
                         requestMethod:(JsonClassMethod) classMethod;


@end
