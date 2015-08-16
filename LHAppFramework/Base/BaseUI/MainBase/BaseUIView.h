//
//  BaseUIView.h
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>




@protocol CustomizedViewEventDelegate <NSObject>








@end



@interface BaseUIView : UIView

@property (nonatomic,assign) id <CustomizedViewEventDelegate> customizedViewDelegate ;

@end
