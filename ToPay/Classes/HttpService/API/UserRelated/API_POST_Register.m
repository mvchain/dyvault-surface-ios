//
//  API_POST_Register.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_POST_Register.h"

@implementation API_POST_Register
- (void)sendRequestWithEmail:(NSString *)email
                  inviteCode:(NSString *)inviteCode
                    nickname:(NSString *)nickname
                    password:(NSString *)password
                       token:(NSString *)token
         transactionPassword:(NSString *)transactionPassword {
    self.apiPath = @"/user/register";
    self.requestDict[@"email"] = email;
    self.requestDict[@"inviteCode"] = inviteCode;
    self.requestDict[@"nickname"] = nickname;
    self.requestDict[@"token"] = token;
    self.requestDict[@"password"] = [QuickGet encryptPwd:password email:email];
    self.requestDict[@"transactionPassword"] = [QuickGet encryptPwd:transactionPassword email:email];;
    [self connectWithRquestMethod:HTTPMethodPOST];
}
@end
