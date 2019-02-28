//
//  API_POST_User.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_POST_User.h"

@implementation API_POST_User
/*
 appuserRegCheckDTO
 Example Value
 Model
 {
 "email": "string",
 "inviteCode": "string",
 "validCode": "string"
 */
- (void)sendRequestWithEmail:(NSString *)email
                  inviteCode:(NSString *)inviteCode
                   validCode:(NSString *)validCode  {
    self.apiPath = @"/user";
    self.requestDict[@"email"] = email;
    self.requestDict[@"inviteCode"] = inviteCode;
    self.requestDict[@"validCode"] = validCode;
    [self connectWithRquestMethod:HTTPMethodPOST];
}
@end
