//
//  YUStatusButtonGroupWithLeftRightButttonNavBarView.h
//  Forum
//
//  Created by yxyyxy on 30/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUStatusButtonGroupNavBarView.h"
@class YUHamburgerButton;

@interface YUStatusButtonGroupWithLeftRightButttonNavBarView : YUStatusButtonGroupNavBarView

@property (strong,nonatomic) YUHamburgerButton * leftButton;

@property (strong,nonatomic) YUHamburgerButton * rightButton;

@property (strong,nonatomic) UIImageView * leftImageView;

@property (strong,nonatomic) UIImageView * rightImageView;

@end
