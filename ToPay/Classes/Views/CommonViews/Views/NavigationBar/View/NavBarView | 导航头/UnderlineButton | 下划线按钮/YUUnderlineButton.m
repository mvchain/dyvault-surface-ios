//
//  YUUnderlineButton.m
//  Forum
//
//  Created by yxyyxy on 29/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUUnderlineButton.h"
#import "UIView+YUStyle.h"
static const CGFloat eW = 44 ;

@implementation YUUnderlineButton

+ (id)defaultUnderlineButton{
    
    YUUnderlineButton * underlineBtn = [[YUUnderlineButton alloc]initWithFrame:CGRectMake(0, 0, eW, 26)];
    return underlineBtn;

}
/**
 设置标题信息

 @param title 标题（字符串）
 */

- (void)setTitle:(NSString *)title {
    [_titleLabel setText:title];
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if( self ){
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, eW, 18)];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:18]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        _titleLabel.userInteractionEnabled=YES;
        [_titleLabel setText:@"推荐"];
        [self addSubview:_titleLabel];
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, eW, 1)];
        [_lineView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_lineView];
        [_lineView y_bottomFromView:_titleLabel distance:5];
        
    }
    return self;
    
}

- (void)selectedStatus {
    [_lineView setBackgroundColor:[UIColor colorWithRed:76/255.0 green:100/255.0 blue:253/255.0 alpha:1]];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [UIView animateWithDuration:0.3 animations:^{
        
        [_lineView setAlpha:1];
        [_titleLabel setAlpha:1];
        
        
    }];
}

- (void)unSelectedStatus {
    [_lineView setBackgroundColor:[UIColor whiteColor]];
    [_titleLabel setTextColor:[UIColor colorWithRed:176/255.0 green:176/255.0  blue:176/255.0  alpha:1]];
    
    [UIView animateWithDuration:0.3 animations:^{
        [_lineView setAlpha:0];
         [_titleLabel setAlpha:0.5];
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
