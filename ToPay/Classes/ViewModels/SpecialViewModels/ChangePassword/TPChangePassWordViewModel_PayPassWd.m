//
//  TPChangePassWordViewModel_PayPassWd.m
//  ToPay
//
//  Created by 蒲公英 on 2019/1/18.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "TPChangePassWordViewModel_PayPassWd.h"
#import "API_PUT_User_TransactionPassword.h"
#import "YUForgetLogin_ResetPasswordViewModel.h"
#import "YUForgetPay_ResetPasswordViewModel.h"
@implementation TPChangePassWordViewModel_PayPassWd
- (id<YUResetPasswordViewModelDelegate>)resetForgetPwdVM {
    return [[YUForgetPay_ResetPasswordViewModel alloc] init];
}
- (void)changePassWdWithOldPassWd:(NSString *)old
                        newPassWd:(NSString *)newPassWd
                         complete:(void(^)(BOOL isSucc,NSString *info))complete {
    
    API_PUT_User_TransactionPassword *User_TransactionPassword = [[API_PUT_User_TransactionPassword alloc] init];
    User_TransactionPassword.onSuccess = ^(id responseData) {
        complete(YES,responseData);
    };
    User_TransactionPassword.onError = ^(NSString *reason, NSInteger code) {
        complete(NO,reason);
    };
    User_TransactionPassword.onEndConnection = ^{
        
    };
    [User_TransactionPassword sendRequestWithNewPassword:newPassWd password:old];
    
}
- (void)action_afterChangePwd:(NSDictionary *)dict {
    UIViewController *vc = dict[@"vc"];
    [vc.navigationController popViewControllerAnimated:YES];
}
- (UIKeyboardType)textFieldKeyboardType {
    return UIKeyboardTypeNumberPad;
}
- (NSString *)firstTextFieldPlaceholder {
    return Localized(@"Original payment password");
}
- (NSString *)nextTextFieldPlaceholder {
    return Localized(@"New payment password");
}
- (NSString *)navBarTitle {
    return Localized(@"modify_payment_password");
}
@end
