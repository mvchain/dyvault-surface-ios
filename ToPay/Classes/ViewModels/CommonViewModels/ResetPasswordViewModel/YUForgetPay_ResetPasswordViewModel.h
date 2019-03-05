//
//  YUChangePay_ResetPasswordViewModel.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YUForgetPay_ResetPasswordViewModel.h"
#import "YUResetPasswordViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface YUForgetPay_ResetPasswordViewModel : NSObject<YUResetPasswordViewModelDelegate>
@property (copy,nonatomic) NSString *token;
@property (copy,nonatomic) NSString *email;
- (id)initWithToken:(NSString *)token email:(NSString *)email; 
@end

NS_ASSUME_NONNULL_END
