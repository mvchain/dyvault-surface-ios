//
//  YUNormalNavBarView.h
//  Forum
//
//  Created by yxyyxy on 30/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUCustomNavBarView.h"
@class YUHamburgerButton;
#define BackImageName @"back_black"
@interface YUNormalNavBarView : YUCustomNavBarView
@property(strong,nonatomic) UILabel * titleLabel;
@property (strong,nonatomic)YUHamburgerButton * leftButton;
@property (strong,nonatomic)YUHamburgerButton * rightButton;

- (void)setLeftButtonAsReturnButton;

- (void)setRightButtonWithTitle:(NSString *)title;

- (void)setRightButtonWithImage:(UIImage *) ima ;


@end
