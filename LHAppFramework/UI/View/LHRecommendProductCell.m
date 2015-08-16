//
//  LHRecommendProductCell.m
//  LHAppFramework
//
//  Created by lyleKP on 15/8/3.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "LHRecommendProductCell.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"
#import "UILabel+LHCreatLabel.h"

#define kSCREEN_SPACE 10
#define kIMAGE_WIDTH (([UIScreen mainScreen].bounds.size.width)/2-15)

@implementation LHRecommendProductCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        self.contentView.autoresizingMask =  UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        


    }
    return self;
}

- (void)initLayoutWithData:(NSArray *)modelAry
               atIndexPath:(NSIndexPath*)indexPath {
    
    NSInteger row = indexPath.row;
    
    for(UIView * view in self.contentView.subviews ){
        [view removeFromSuperview];
    }
    
    NSMutableArray * twoProductAry = [[NSMutableArray alloc] initWithCapacity:0];
    
    [twoProductAry addObject:modelAry[2*row]];
    [twoProductAry addObject:modelAry[2*row+1]];
    
    [self fillOneLineWithAry:twoProductAry];
    twoProductAry = nil;
   
    
}


- (void)fillOneLineWithAry:(NSArray *)ary {
    

    NSInteger cout =0;

    for(KPRecommendProductModel * model in ary){
        CGFloat x =cout*kIMAGE_WIDTH;
        if(cout>0) {
            x =cout*kIMAGE_WIDTH+5;
        }
        
        self.imageViewProduct= [[UIImageView alloc] initWithFrame:CGRectMake(x+kSCREEN_SPACE, 10, kIMAGE_WIDTH, kIMAGE_WIDTH)];
        
        self.labelDescriLabelProduct = [UILabel lh_descriptionLabelFrame:CGRectMake(x+kSCREEN_SPACE, CGRectGetMaxY(self.imageViewProduct.frame)+5, kIMAGE_WIDTH, 30) String:model.title];
        
       self.labelNewPrice = [UILabel lh_priceLabelFrame:CGRectMake(x+kSCREEN_SPACE, CGRectGetMaxY(self.labelDescriLabelProduct.frame)+2, 75, 20) String:[NSString stringWithFormat:@"¥%@",model.price]];
        
        self.labelOldPrice = [UILabel lh_oldPriceLabelFrame:CGRectMake(CGRectGetMaxX(self.labelNewPrice.frame)+30, CGRectGetMaxY(self.labelDescriLabelProduct.frame)+2, 75, 20) WithString:[NSString stringWithFormat:@"¥%@",model.markPrice]];
        
        
     NSString *  imageUrlStr= [NSString stringWithFormat:@"http://images.kuparts.com/%@/PRODUCTS/Thumbnail-310x310/%@",model.shopId,model.img];
        
        [self.imageViewProduct sd_setImageWithURL:[NSURL URLWithString:imageUrlStr] placeholderImage:[UIImage imageNamed: @"default－portrait"]];
        
 

        UIView *lineView = [UIView lh_lineViewWithFrame:CGRectMake(CGRectGetMaxX(self.labelNewPrice.frame)+30, CGRectGetMaxY(self.labelDescriLabelProduct.frame)+2+10, 57, 0.5)];
        
        [self.contentView addSubview:lineView];

        
        [self.contentView addSubview:self.imageViewProduct];
        [self.contentView addSubview:self.labelDescriLabelProduct];
        [self.contentView addSubview:self.labelNewPrice];
        [self.contentView addSubview:self.labelOldPrice];
        
        cout ++;
    }
}

//- (void)initLayOut {
//    
//    for(UIView * view in [self.contentView subviews]) {
//        view.translatesAutoresizingMaskIntoConstraints = NO;
//    }
//    NSDictionary * viewsDic = NSDictionaryOfVariableBindings(_imageViewProduct,_labelDescriLabelProduct,_labelNewPrice,_labelOldPrice);
//    
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[_imageViewProduct]-3-[_labelDescriLabelProduct]-3-[_labelNewPrice]"
//                                                                            options:NSLayoutFormatAlignAllRight|
//                                                                                    NSLayoutFormatAlignAllLeft
//                                                                            metrics:nil
//                                                                              views:viewsDic]];
//    [NSLayoutConstraint constraintsWithVisualFormat:@"|8-[_imageViewProduct]-8|" options:0 metrics:nil views:viewsDic];
//    
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[_imageViewProduct]-3-[_labelDescriLabelProduct]-3-[_labelNewPrice]"
//                                                                             options:NSLayoutFormatAlignAllRight|
//                                      NSLayoutFormatAlignAllLeft
//                                                                             metrics:nil
//                                                                               views:viewsDic]];
//    
//
//    
//    
//}

@end
