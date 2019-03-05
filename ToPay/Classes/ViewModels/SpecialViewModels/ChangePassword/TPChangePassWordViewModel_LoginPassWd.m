//
//  TPChangePassWordViewModel_LoginPassWd.m
//  ToPay
//
//  Created by 蒲公英 on 2019/1/17.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "TPChangePassWordViewModel_LoginPassWd.h"
#import "API_PUT_User_Password.h"
#import "YUForgetLogin_ResetPasswordViewModel.h"
#import "YUForgetPay_ResetPasswordViewModel.h"

@implementation TPChangePassWordViewModel_LoginPassWd

- (void)changePassWdWithOldPassWd:(NSString *)old
                        newPassWd:(NSString *)newPassWd
                         complete:(void(^)(BOOL isSucc,NSString *info))complete {
    
    API_PUT_User_Password *User_Password = [[API_PUT_User_Password alloc] init];
    User_Password.onSuccess = ^(id responseData) {
        complete(YES,(NSString *)responseData);
    };
    User_Password.onError = ^(NSString *reason, NSInteger code) {
        complete(NO,reason);
    };
    User_Password.onEndConnection = ^{
        
    };
    
    [User_Password sendRequestWithNewPassword:newPassWd password:old];
}
- (void)action_afterChangePwd:(NSDictionary *)dict {
    [[YUViewControllerManagers shareInstance] clearUserInfo_AndExit];
}
- (id<YUResetPasswordViewModelDelegate>)resetForgetPwdVM {
    return [[YUForgetLogin_ResetPasswordViewModel alloc] init];
}
- (UIKeyboardType)textFieldKeyboardType {
    return UIKeyboardTypeAlphabet;
}
- (NSString *)firstTextFieldPlaceholder {
    return @"原登录密码";
}
- (NSString *)nextTextFieldPlaceholder {
    return @"新登录密码";
}
- (NSString *)navBarTitle {
    return @"修改登录密码";
}

@end
