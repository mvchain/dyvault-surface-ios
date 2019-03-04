//
//  YUChangePay_ResetPasswordViewModel.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUChangePay_ResetPasswordViewModel.h"

@implementation YUChangePay_ResetPasswordViewModel

- (void)confirmActionWithPassword:(nonnull NSString *)password onSucc:(nonnull void (^)(NSDictionary * _Nonnull))onSucc onFail:(nonnull void (^)(NSDictionary * _Nonnull))onFail onEndConnection:(nonnull void (^)(void))onEndConnection {
    
}

- (nonnull NSString *)navBarTitleName {
   return @"修改支付密码";
}


- (nonnull NSString *)textPlaceholder {
    return @"新支付密码";
}

- (UIKeyboardType)passTextFieldkeyBoardType  {
    return UIKeyboardTypeNumberPad;
}

@end
