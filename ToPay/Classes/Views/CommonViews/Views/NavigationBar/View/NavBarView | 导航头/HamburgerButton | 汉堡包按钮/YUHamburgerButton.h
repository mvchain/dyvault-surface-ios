//
//  YUHamburgerButton.h
//  Forum
//
//  Created by yxyyxy on 29/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface YUHamburgerButton : UIView

@property (strong ,nonatomic) UIView * midView;
@property (strong ,nonatomic) UIButton * topButton;
@property (copy, nonatomic) void(^onClick)(id)  ;

@end
