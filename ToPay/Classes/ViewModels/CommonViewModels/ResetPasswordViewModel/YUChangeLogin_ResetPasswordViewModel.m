//
//  YUChangeLogin_ResetPasswordViewModel.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUChangeLogin_ResetPasswordViewModel.h"

@implementation YUChangeLogin_ResetPasswordViewModel

- (void)confirmActionWithPassword:(nonnull NSString *)password onSucc:(nonnull void (^)(NSDictionary * _Nonnull))onSucc onFail:(nonnull void (^)(NSDictionary * _Nonnull))onFail onEndConnection:(nonnull void (^)(void))onEndConnection {
    
}

- (nonnull NSString *)navBarTitleName {
    return @"修改登录密码";
}

- (nonnull NSString *)textPlaceholder {
    return @"新登录密码";
}
- (UIKeyboardType)passTextFieldkeyBoardType  {
    return UIKeyboardTypeAlphabet;
}
@end
