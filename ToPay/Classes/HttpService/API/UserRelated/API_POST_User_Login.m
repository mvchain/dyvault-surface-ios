//
//  API_POST_User_Login.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_POST_User_Login.h"

@implementation API_POST_User_Login
- (void)sendRequestWithImageToken:(NSString *)imageToken
                         password:(NSString *)password
                         username:(NSString *)username
                        validCode:(NSString *)validCode {
    self.apiPath = @"/user/login";
    self.requestDict[@"imageToken"] = imageToken;
    self.requestDict[@"password"] = [QuickGet encryptPwd:password email:username];
    self.requestDict[@"username"] = username;
    self.requestDict[@"validCode"] = validCode;
    [self connectWithRquestMethod:HTTPMethodPOST];
}

@end
