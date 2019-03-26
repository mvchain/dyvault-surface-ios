//
//  YUForget_ResetPasswordViewModel.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUForgetLogin_ResetPasswordViewModel.h"
#import "API_PUT_User_Forget.h"
@implementation YUForgetLogin_ResetPasswordViewModel

- (id)initWithToken:(NSString *)token email:(NSString *)email {
    self = [super init];
    if (self) {
        _token = token; // for change pwd
        _email = email;
    }
    return self;
}
#pragma mark confirm protocol
- (void)action_afterResetSucc:(NSDictionary *)dict{
    [[YUViewControllerManagers shareInstance]clearUserInfo_AndExit];
    
}
- (void)confirmActionWithPassword:(NSString *)password
                           onSucc:(void(^)(NSDictionary *succDict ))onSucc
                           onFail:(void(^)(NSDictionary *failDict ))onFail
                  onEndConnection:(void(^)(void))onEndConnection {
    
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
                                        type:1
                                       email:self.email];
}
- (NSString *)navBarTitleName {
    return Localized(@"Reset login password");
}
- (NSString *)textPlaceholder {
    return Localized(@"New login password");
}
- (UIKeyboardType)passTextFieldkeyBoardType  {
    return UIKeyboardTypeAlphabet;
}
@end
