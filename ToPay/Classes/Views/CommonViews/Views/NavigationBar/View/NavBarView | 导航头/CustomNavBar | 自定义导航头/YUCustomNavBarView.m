//
//  YUCustomNavBarView.m
//  Forum
//
//  Created by yxyyxy on 29/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUStatusButtonGroupNavBarView.h"
#import "YUPhoneInformationTools.h"

#import "YUUnderlineButton.h"
#import "UIView+YUStyle.h"
#import "YUDIVView.h"
#import "YUHamburgerButton.h"
#import "YUStatusButtonGroupWithLeftRightButttonNavBarView.h"
#import "YUNormalNavBarView.h"
#pragma mark 首页NavBar
#pragma mark 最顶层
@implementation YUCustomNavBarView;

+ ( CGRect )navbarFrame {
    return CGRectMake(0, 0, [ YUPhoneInformationTools screenWidth ], [YUPhoneInformationTools navBarBottom]);
}

+ ( YUStatusButtonGroupNavBarView * )customIndexNavBarView{
    YUStatusButtonGroupNavBarView * customIndexBarView = [[YUStatusButtonGroupNavBarView alloc]initWithFrame:[YUCustomNavBarView navbarFrame]];
    return  customIndexBarView;
}
+ (YUStatusButtonGroupWithLeftRightButttonNavBarView * )statusButtonGroupWithLeftRightButttonNavBarView {
    YUStatusButtonGroupWithLeftRightButttonNavBarView * view = [[YUStatusButtonGroupWithLeftRightButttonNavBarView alloc]initWithFrame:[YUCustomNavBarView navbarFrame]];
    
    return view;
}

+(YUNormalNavBarView *)normalNavBarView{
    YUNormalNavBarView * view = [[YUNormalNavBarView alloc]initWithFrame:[YUCustomNavBarView navbarFrame]];
    return view;
}

@end
