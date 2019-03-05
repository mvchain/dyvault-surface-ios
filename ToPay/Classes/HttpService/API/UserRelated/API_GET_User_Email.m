//
//  API_GET_User_Email.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_User_Email.h"

@implementation API_GET_User_Email
- (void)sendRequest {
    self.apiPath = @"/user/email";
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
