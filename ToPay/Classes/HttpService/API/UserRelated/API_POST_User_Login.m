//
//  API_POST_User_Login.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_POST_User_Login.h"
#import "API_POST_User_Salt.h"
@implementation API_POST_User_Login
- (void)sendRequestWithImageToken:(NSString *)imageToken
                         password:(NSString *)password
                         username:(NSString *)username
                        validCode:(NSString *)validCode {
    
    API_POST_User_Salt *POST_User_Salt = [[API_POST_User_Salt alloc]init];
    POST_User_Salt.onSuccess = ^(id responseData) {
        NSString *salt = (NSString *)responseData;
        self.apiPath = @"/user/login";
        self.requestDict[@"imageToken"] = imageToken;
        self.requestDict[@"password"] = [QuickGet encryptPwd:password salt:salt];
        self.requestDict[@"username"] = username;
        self.requestDict[@"validCode"] = validCode;
        [self connectWithRquestMethod:HTTPMethodPOST];
    };
    POST_User_Salt.onError = self.onError;
    POST_User_Salt.onEndConnection = self.onEndConnection;
    [POST_User_Salt sendRequestWithEmail:username];
    
}

@end
