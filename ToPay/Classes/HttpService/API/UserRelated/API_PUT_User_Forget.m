//
//  API_PUT_User_Forget.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_PUT_User_Forget.h"

@implementation API_PUT_User_Forget
- (void)sendRequestWithPassword:(NSString *)password
                          token:(NSString *)token
                           type:(NSInteger) type
                          email:(NSString *)email
{
    
    // note: email will not post to server ,just for encrypt
    self.apiPath = @"/user/forget";
    self.requestDict[@"password"] = [QuickGet encryptPwd:password email:email];
    self.requestDict[@"token"] = token;
    self.requestDict[@"type"] = @(type);
    [self connectWithRquestMethod:HTTPMethodPUT];
}
@end
