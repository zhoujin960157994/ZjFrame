//
//  LHAboutMeViewController.m
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "LHAboutMeViewController.h"


@implementation LHAboutMeViewController

- (instancetype)init {
    self = [super init];
    if(self ) {
        [self setUpNaviRightButton];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];


    
    [self setUpNaviRightButton];
    
}

/**
 *  重载父类的方法，不调super
 */
- (void)setUpNaviRightButton {
    
    self.navigationItem.leftBarButtonItem = nil;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem  itemWithTarget:self action:@selector(btnSearch) image:@"aboutMeNaviRight_n" selectedImage:@"aboutMeNaviRight_h"];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    
}

- (void)btnSearch {
    
    NSLog(@"aboutMe");
}



@end
