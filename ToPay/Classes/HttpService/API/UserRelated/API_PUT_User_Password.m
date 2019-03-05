//
//  API_PUT_User_Password.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_PUT_User_Password.h"

@implementation API_PUT_User_Password
- (void)sendRequestWithNewPassword:(NSString *)newPassword
                          password:(NSString *)password {
    NSString *salt = [YUUserManagers shareInstance].userIDCard_inDisk.email;
    self.apiPath = @"/user/password";
    self.requestDict[@"newPassword"] = [QuickGet encryptPwd:newPassword email:salt];
    self.requestDict[@"password"] = [QuickGet encryptPwd:password email:salt];
    [self connectWithRquestMethod:HTTPMethodPUT];
}
@end
