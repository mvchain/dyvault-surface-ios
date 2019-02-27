//
//  YUUnderlineButton.h
//  Forum
//
//  Created by yxyyxy on 29/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface YUUnderlineButton : UIView

@property (strong,nonatomic) UILabel * titleLabel;

@property (strong,nonatomic) UIView * lineView;

-(void)setTitle:(NSString *)title ;

+ (id)defaultUnderlineButton;

- (void)selectedStatus;

- (void)unSelectedStatus;

@end
