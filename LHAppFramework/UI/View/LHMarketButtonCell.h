//
//  LHMarketButtonCell.h
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LH_SendButtonClickedMessage <NSObject>

-(void)sendButtonClickedMessage:(UIButton *)button;

@end

@interface LHMarketButtonCell : UITableViewCell

@property (nonatomic,assign)id <LH_SendButtonClickedMessage> btnDelegate;

- (void)initButtonLayOutWithProductNameAry:(NSArray *)productNameAry
                              ImageNameAry:(NSArray *)imageNameAry;




@end
