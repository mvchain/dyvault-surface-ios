//
//  API_PUT_User_Forget.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_PUT_User_Forget.h"
#import "API_POST_User_Salt.h"
@implementation API_PUT_User_Forget
- (void)sendRequestWithPassword:(NSString *)password
                          token:(NSString *)token
                           type:(NSInteger) type
                          email:(NSString *)email
{
   
    API_POST_User_Salt *POST_User_Salt = [[API_POST_User_Salt alloc]init];
    POST_User_Salt.onSuccess = ^(id responseData) {
        NSString *salt = (NSString *)responseData;
        self.apiPath = @"/user/forget";
        self.requestDict[@"password"] = [QuickGet encryptPwd:password salt:salt];
        self.requestDict[@"token"] = token;
        self.requestDict[@"type"] = @(type);
        [self connectWithRquestMethod:HTTPMethodPUT];
    };
    POST_User_Salt.onError = self.onError;
    POST_User_Salt.onEndConnection = self.onEndConnection;
    [POST_User_Salt sendRequestWithEmail:email];
    
   
}
@end
