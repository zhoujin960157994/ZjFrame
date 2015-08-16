//
//  BaseTabBarViewController.m
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseTableViewController.h"
#import "BaseNavigationViewController.h"
#import "BaseViewController.h"

#import "LHHomesViewController.h"
#import "LHArticlesTableViewController.h"
#import "LHAboutMeViewController.h"

#import "UIBarButtonItem+Extension.h"


#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

@interface BaseTabBarViewController () {
    


}

@end

@implementation BaseTabBarViewController




-(instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
         [self initWithFourViewController];
        
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
   
}
/**
 *  初始子控制器
 */
- (void)initWithFourViewController {

    
    /**
     主页带滑动显示
     
     */
    NSMutableArray * ary = [[NSMutableArray alloc] initWithCapacity:0];
    
    LHHomesViewController * vc1  = [[LHHomesViewController alloc]  init];
    
    [ary addObject:vc1];
    BaseViewController * tbvC = [[BaseViewController alloc] init];
    
    [ary addObject:tbvC];
    NSInteger i = 0 ;
    for(i= 0; i <3;i ++) {
        BaseViewController * vc = [[BaseViewController alloc] init];
        [ary addObject:vc];
    }
    
    SwipableViewController * home = [[SwipableViewController alloc] initWithTitle:@"首页" andSubTitles:@[@"首页",@"咨询",@"意见",@"商城",@"用品"]
                                                                   andControllers:ary];
    
    [self addChildViewController:home andSetUpTabbarOfViewControllerWithTitle:@"首页" andImage:@"tabbar_n1" annSelectedImage:@"tabbar_s1"];
    /**
     *  其他不带滑动条
     */
    //用品

    NSArray * nameAry1 = @[@"座套",@"坐垫",@"脚垫",@"车膜",@"GPS",@"香水",@"防盗锁",@"车蜡"];
    NSArray * imageAry = @[@"zuoTao",@"zuoDian",@"jiaoDian",@"cheMo",@"GPS",@"xiangShui",@"fangDaoSuo",@"cheLa"];
    

    LHArticlesTableViewController * articles = [[LHArticlesTableViewController alloc] init];
    

    [self addChildViewController:articles andSetUpTabbarOfViewControllerWithTitle:@"用品" andImage:@"tabbar_n2" annSelectedImage:@"tabbar_s2"];
    
    [articles initViewControllerWithProducts:nameAry1 buttonImages:imageAry requestMethod:kClassMethod_Market];

    //配件
    NSArray * nameAry2 = @[@"疝气灯",@"火花塞",@"雨刮",@"机油",@"滤清器",@"刹车片",@"防盗锁",@"轮胎"];
    NSArray * imageAry2 = @[@"shanQiDeng",@"huoHuaSai",@"yuGua",@"jiYou",@"lvQingQi",@"jianZhenQi",@"shaChePian",@"lunTai"];
    
    LHArticlesTableViewController * parts  = [[LHArticlesTableViewController alloc] init];
    
    [parts initViewControllerWithProducts:nameAry2 buttonImages:imageAry2 requestMethod:kClassMethod_CarArticls];

    [self addChildViewController:parts andSetUpTabbarOfViewControllerWithTitle:@"配件" andImage:@"tabbar_n3" annSelectedImage:@"tabbar_s3"];
    
    //服务
    NSArray * nameAry3 = @[@"洗车",@"抛光打蜡",@"镀膜镀晶",@"钣金修复",@"四轮定位",@"换三滤",@"车灯改装",@"换胎"];
    NSArray * imageAry3 = @[@"xiChe",@"paoGuangDaLa",@"duMoDuJing",@"banJinXiuFu",@"siLunDingWei",@"huanSanLv",@"cheDengGaiZhuang",@"huanTai"];
    
    LHArticlesTableViewController * service = [[LHArticlesTableViewController alloc] init];
    
    [service initViewControllerWithProducts:nameAry3 buttonImages:imageAry3 requestMethod:kClassMethod_Serverce];

    [self addChildViewController:service andSetUpTabbarOfViewControllerWithTitle:@"服务" andImage:@"tabbar_n4" annSelectedImage:@"tabbar_s4"];
    
    LHAboutMeViewController * vc5= [[LHAboutMeViewController alloc] init];
    
    [self addChildViewController:vc5 andSetUpTabbarOfViewControllerWithTitle:@"我的" andImage:@"tabbar_n5" annSelectedImage:@"tabbar_s5"];

}
/**
 *  设置控制器tabbar的样式
 *
 *  @param title             标题
 *  @param imageName         正常状态图片名字
 *  @param selectedImageName 选中状态图片名字
 */
- (void)addChildViewController:(UIViewController *)childViewController
    andSetUpTabbarOfViewControllerWithTitle:(NSString *)title
                                    andImage:(NSString *)imageName
                            annSelectedImage:(NSString * )selectedImageName


{
    childViewController.tabBarItem.title = title;
    
    childViewController.navigationItem.title = title;
    
    NSMutableDictionary * textNomalAttributesDic = [[NSMutableDictionary alloc] init];
    
    textNomalAttributesDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    NSMutableDictionary * textSelectedAttributesDic = [[NSMutableDictionary alloc] init];
    
    textSelectedAttributesDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childViewController.tabBarItem setTitleTextAttributes:textNomalAttributesDic forState:UIControlStateNormal];
    
    [childViewController.tabBarItem setTitleTextAttributes:textSelectedAttributesDic forState:UIControlStateSelected];
    
    
    childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 即使使用的图片有渲染颜色，也会被渲染成系统蓝色
    //    self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_s1"];
    
   //使用图片不渲染
    UIImage * Image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.image = Image;
    
    UIImage * selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.selectedImage = selectedImage;
    
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:childViewController];
    

    [self addChildViewController:nav];
    
}

#pragma mark --
#pragma mark -- lifeCycle method 

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
}





@end
