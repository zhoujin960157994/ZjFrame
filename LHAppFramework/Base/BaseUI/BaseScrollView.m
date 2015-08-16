//
//  BaseScrollView.m
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseScrollView.h"

@implementation BaseScrollView


- (instancetype)init {
    self = [super init];
    if(self) {
        self = [[BaseScrollView alloc] init];

    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if(self ) {
        
        
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.superview touchesBegan:touches withEvent:event];
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

@end
