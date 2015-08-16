//
//  LHRecommendProductCell.h
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPRecommendProductModel.h"
@interface LHRecommendProductCell : UITableViewCell

@property (nonatomic,strong) UIImageView * imageViewProduct;
@property (nonatomic,strong) UILabel * labelDescriLabelProduct;
@property (nonatomic,strong) UILabel *labelNewPrice;
@property (nonatomic,strong) UILabel *labelOldPrice ;




- (void)initLayoutWithData:(NSArray *)model
               atIndexPath:(NSIndexPath*)indexPath ;

@end
