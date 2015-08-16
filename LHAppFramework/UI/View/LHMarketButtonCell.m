//
//  LHMarketButtonCell.m
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "LHMarketButtonCell.h"
#import "UIButton+LHCreate.h"



#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


@implementation LHMarketButtonCell

- (void)initButtonLayOutWithProductNameAry:(NSArray *)productNameAry
                              ImageNameAry:(NSArray *)imageNameAry {
    
    
    
    NSInteger row = 2;
    
    NSInteger line = 4;
    
    NSInteger width = (SCREEN_WIDTH-20)/line;
    
    NSInteger height = 100;
    
    for(row =0 ; row<2; row ++) {
        
        for(NSInteger i = 0; i<line;i ++) {
            
            UIButton * btn = [UIButton lh_creatButton:CGRectMake(10+width*i,row* height+0, width, height)
                                                Image:imageNameAry[row*4+i]
                                                Title:productNameAry[row*4+i]
                                             forState:UIControlStateNormal];
            btn.tag = row*4+i;
    
            [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [btn setTitleShadowColor:[UIColor redColor] forState:UIControlStateSelected];
            
            [self.contentView addSubview:btn];
        }
    }
    
    

    
}


#pragma mark -- LH_SendButtonClickedMessage  Delegate

- (void)buttonClicked:(UIButton *)button {
    
    [self.btnDelegate sendButtonClickedMessage:button];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
