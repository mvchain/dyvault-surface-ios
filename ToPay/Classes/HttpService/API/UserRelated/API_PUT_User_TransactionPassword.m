//
//  API_PUT_User_TransactionPassword.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_PUT_User_TransactionPassword.h"
@implementation API_PUT_User_TransactionPassword
- (void)sendRequestWithNewPassword:(NSString *)newPassword
                          password:(NSString *)password {
    NSString *salt = [YUUserManagers shareInstance].userIDCard_inDisk.salt;
    self.apiPath = @"/user/transactionPassword";
    self.requestDict[@"newPassword"] = [QuickGet encryptPwd:newPassword salt:salt];
    self.requestDict[@"password"] = [QuickGet encryptPwd:password salt:salt];
    [self connectWithRquestMethod:HTTPMethodPUT];
}
@end
