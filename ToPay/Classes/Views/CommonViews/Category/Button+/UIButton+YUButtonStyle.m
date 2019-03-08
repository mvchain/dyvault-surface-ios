//
//  UIButton+YUButtonStyle.m
//  ToPay
//
//  Created by 蒲公英 on 2019/1/16.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "UIButton+YUButtonStyle.h"
#import "UIView+YUStyle.h"
#import "UIButton+Gradient.h"
#import <QMUIKit.h>
@implementation UIButton (YUButtonStyle)
/*
 
 #import "UIButton+Gradient.h"
 @[[UIColor qmui_colorWithHexString:@"#007AFF"],[UIColor qmui_colorWithHexString:@"#5856D6"]] percentageArray:@[@0,@1] gradientType:GradientFromLeftToRight];
 */

- (void)yu_fullPurpleCircleStyle {
    [self yu_circleStyle];
    [self setBackgroundColor:[UIColor qmui_colorWithHexString:@"#5A5CC7"]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)yu_gradualBlueChangeStyle {
    [self yu_circleStyle];
    [self gradientButtonWithSize:self.bounds.size colorArray:@[[UIColor qmui_colorWithHexString:@"#007AFF"],[UIColor qmui_colorWithHexString:@"#5856D6"]] percentageArray:@[@0,@1] gradientType:GradientFromLeftToRight];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)yu_fullBlueCircleStyle {
    [self yu_circleStyle];
    [self setBackgroundColor:[UIColor qmui_colorWithHexString:@"#2263AC"]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
- (void)yu_vaildButtonStyle {
    
    self.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self setTitleColor:[UIColor qmui_colorWithHexString:@"#5A5DDF"] forState:UIControlStateNormal];
}
@end
