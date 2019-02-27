//
//  YUCustomNavBarView.h
//  Forum
//
//  Created by yxyyxy on 29/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YUStatusButtonGroupNavBarView;
@class YUStatusButtonGroupWithLeftRightButttonNavBarView;
@class YUNormalNavBarView;

@interface YUCustomNavBarView : UIView

+ ( YUStatusButtonGroupNavBarView * )customIndexNavBarView;

+ (YUStatusButtonGroupWithLeftRightButttonNavBarView * )statusButtonGroupWithLeftRightButttonNavBarView;

+(YUNormalNavBarView *)normalNavBarView;

+ ( CGRect )navbarFrame ;



@end
