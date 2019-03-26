//
//  YUChangePay_ResetPasswordViewModel.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUForgetPay_ResetPasswordViewModel.h"
#import "API_PUT_User_Forget.h"
@implementation YUForgetPay_ResetPasswordViewModel
- (id)initWithToken:(NSString *)token email:(NSString *)email {
    self = [super init];
    if (self) {
        _token = token; // for change pwd
        _email = email;
    }
    return self;
}

- (void)action_afterResetSucc:(NSDictionary *)dict{
    UIViewController *vc = (UIViewController *)dict[@"vc"];
    [vc.navigationController popToRootViewControllerAnimated:YES];
}
- (void)confirmActionWithPassword:(nonnull NSString *)password onSucc:(nonnull void (^)(NSDictionary * _Nonnull))onSucc onFail:(nonnull void (^)(NSDictionary * _Nonnull))onFail onEndConnection:(nonnull void (^)(void))onEndConnection {
    API_PUT_User_Forget *PUT_User_Forget = [[API_PUT_User_Forget alloc] init];
    PUT_User_Forget.onSuccess = ^(id responseData) {
        onSucc(@{@"data":@"000"});
    };
    PUT_User_Forget.onError = ^(NSString *reason, NSInteger code) {
        onFail(@{@"reason":reason});
    };
    PUT_User_Forget.onEndConnection = ^{
        onEndConnection();
    };
    [PUT_User_Forget sendRequestWithPassword:password
                                       token:self.token
                                        type:2
                                       email:self.email];
}

- (nonnull NSString *)navBarTitleName {
   return Localized(@"Reset payment password");
}


- (nonnull NSString *)textPlaceholder {
    return Localized(@"New payment password");
}

- (UIKeyboardType)passTextFieldkeyBoardType  {
    return UIKeyboardTypeNumberPad;
}

@end
