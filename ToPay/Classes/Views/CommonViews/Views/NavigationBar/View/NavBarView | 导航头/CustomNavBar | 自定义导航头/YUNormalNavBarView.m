//
//  YUNormalNavBarView.m
//  Forum
//
//  Created by yxyyxy on 30/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUNormalNavBarView.h"
#import "UIView+YUStyle.h"

#import "YUHamburgerButton.h"
#import "YUPhoneInformationTools.h"

@interface YUNormalNavBarView()

@property (weak,nonatomic) UIViewController *currentVC;

@end

@implementation YUNormalNavBarView

- (UIViewController*)currentVC {
    if (!_currentVC) {
        _currentVC = self.qmui_viewController;
        
    }
    return _currentVC;
    
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    self.backgroundColor= [UIColor whiteColor];
    _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, [self y_Width], 20)];
    if (@available(iOS 8.2, *)) {
        [_titleLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightLight]];
    } else {
        [_titleLabel setFont:[UIFont systemFontOfSize:18]];
    }
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setTextColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]];
    _leftButton = [[YUHamburgerButton alloc]initWithFrame:[YUPhoneInformationTools llnavButtonFrame]];
    _rightButton =[[YUHamburgerButton alloc]initWithFrame:[YUPhoneInformationTools rrnavButtonFrame]];
    [self addSubview:_rightButton];
    [self addSubview:_leftButton];
    [self addSubview:_titleLabel];
     [_titleLabel y_setBottom:14];
}

- (void)setLeftButtonAsReturnButton{
 
    [_leftButton.midView removeFromSuperview];
    UIImageView * imav = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 8,16)];
    [imav setImage:[UIImage imageNamed:BackImageName]];
    [_leftButton setMidView:imav];
    __weak typeof (self) wsf = self;
    _leftButton.onClick = ^(id sender) {
        [wsf.currentVC.navigationController popViewControllerAnimated:YES];
        
    };
    [imav y_setLeft:20];
    [imav y_setBottom:11];

}

- (void)setLeftButtonWithImage:(UIImage *)ima withSize:(CGSize)size {
    
    [_leftButton.midView removeFromSuperview];
    UIImageView * imav = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [imav setImage:ima];
    [_leftButton setMidView:imav];
    [imav y_setLeft:20];
    [imav y_setBottom:11];
    
}
- (void)setRightButtonWithImage:(UIImage *) ima {
     [_rightButton.midView removeFromSuperview];
    UIImageView * imaView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 17, 17)];
    [imaView setImage:ima];
    [_rightButton setMidView:imaView];
    [imaView y_setRight:20];
    [imaView y_setBottom:12];
}
- (void)setRightButtonWithImage:(UIImage *)ima
                       withSize:(CGSize)size
                      withRight:(CGFloat)right
                     withBottom:(CGFloat)bottom {
    
    [_rightButton.midView removeFromSuperview];
    UIImageView * imaView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [imaView setImage:ima];
    [_rightButton setMidView:imaView];
    [imaView y_setRight:right];
    [imaView y_setBottom:bottom];
    
}

- (void)setRightButtonWithTitle:(NSString *)title{
    
    [_rightButton.midView removeFromSuperview];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 45, 15)];
    [lab setTextAlignment:NSTextAlignmentCenter];
    
    UIFont * ft =[[UIFont alloc]init];
    
    if ( @available( iOS 8.2, * ) )
    {
        ft = [UIFont systemFontOfSize:15 weight:UIFontWeightLight];
    } else {
        /* Fallback on earlier versions */
        ft = [UIFont systemFontOfSize:15];
    }
    [lab setFont:ft];
    
    [lab setTextColor:[UIColor whiteColor]];
    [lab setText:title];
    [_rightButton setMidView:lab];
    [lab y_setRight:16];
    [lab y_setBottom:11];
    
    
}
@end
