//
//  API_PUT_User_Email.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_PUT_User_Email.h"

@implementation API_PUT_User_Email
- (void)sendRequestWithEmail:(NSString *)email
                       token:(NSString *)token
                   validcode:(NSString *)validcode {
    self.apiPath = @"/user/email";
    self.requestDict[@"email"] = email;
    self.requestDict[@"token"] = token;
    self.requestDict[@"validcode"] = validcode;
    [self connectWithRquestMethod:HTTPMethodPUT];
    
}
@end
