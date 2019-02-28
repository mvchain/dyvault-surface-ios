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


- (void)yu_fullPurpleCircleStyle {
    [self yu_circleStyle];
    [self setBackgroundColor:[UIColor qmui_colorWithHexString:@"#5A5CC7"]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
- (void)yu_fullBlueCircleStyle {
    [self yu_circleStyle];
    [self setBackgroundColor:[UIColor qmui_colorWithHexString:@"#2263AC"]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
- (void)yu_vaildButtonStyle {
    [self yu_circleStyle];
    self.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self setBackgroundColor:[UIColor qmui_colorWithHexString:@"#949494"]];
    [self setTitleColor:[UIColor qmui_colorWithHexString:@"#555555"] forState:UIControlStateNormal];
}
@end
