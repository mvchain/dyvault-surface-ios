//
//  YUValidEmailViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBaseViewController.h"
#import "YUResetPasswordViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface YUValidEmailViewController : YUBaseViewController
@property (strong ,nonatomic) id<YUResetPasswordViewModelDelegate> resetForgetPwdVM;
@end

NS_ASSUME_NONNULL_END
