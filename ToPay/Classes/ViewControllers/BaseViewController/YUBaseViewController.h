//
//  YUBaseViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/27.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QMUICommonViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class YUNormalNavBarView;

@interface YUBaseViewController : QMUICommonViewController
@property (strong ,nonatomic) YUNormalNavBarView * normalNavbar;

- (void)addNormalNavBar:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
