//
//  YUStatusButtonGroupWithLeftRightButttonNavBarView.m
//  Forum
//
//  Created by yxyyxy on 30/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUStatusButtonGroupWithLeftRightButttonNavBarView.h"
#import "YUPhoneInformationTools.h"
#import "YUHamburgerButton.h"
#import "UIView+YUStyle.h"

static const CGFloat iconWidth = 16 ;

@implementation YUStatusButtonGroupWithLeftRightButttonNavBarView

- (void)setUp{
    // 父类方法
    [super setUp];
    _leftButton = [[YUHamburgerButton alloc]initWithFrame:[YUPhoneInformationTools llnavButtonFrame]];
    _rightButton =[[YUHamburgerButton alloc]initWithFrame:[YUPhoneInformationTools rrnavButtonFrame]];
    [self addSubview:_rightButton];
    [self addSubview:_leftButton];
  
    _leftImageView= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, iconWidth, iconWidth)];
    [_leftImageView setImage:[UIImage imageNamed:@"search"]];
    
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, iconWidth, iconWidth)];
    [_rightImageView setImage:[UIImage imageNamed:@"write"]];
    
    [_leftButton setMidView:_leftImageView];
    [_rightButton setMidView:_rightImageView];
    [_leftImageView y_setLeft:15];
    [_leftImageView y_setBottom:11];
    [_rightImageView y_setRight:15];
    [_rightImageView y_setBottom:11];
    
}

@end
