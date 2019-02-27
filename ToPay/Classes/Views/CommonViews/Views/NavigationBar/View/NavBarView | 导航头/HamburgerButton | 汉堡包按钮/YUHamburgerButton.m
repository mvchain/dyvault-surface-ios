//
//  YUHamburgerButton.m
//  Forum
//
//  Created by yxyyxy on 29/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUHamburgerButton.h"

@implementation YUHamburgerButton


-(id)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if(self){
        [self setUp];
    }
    
    return self;
}

-(void)setUp{
    _topButton = [[UIButton alloc]initWithFrame:self.bounds];
    [_topButton addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_topButton];
    
}

- (void)buttonTouchUpInside:(id)sender{
    
    if(_onClick){
        _onClick(self);
    }
}
-(void)setMidView:(UIView *)v{
    _midView = v;
    [self insertSubview:v belowSubview:_topButton];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
