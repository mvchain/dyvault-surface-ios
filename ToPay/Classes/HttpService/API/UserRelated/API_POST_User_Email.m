//
//  API_POST_User_Email.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_POST_User_Email.h"

@implementation API_POST_User_Email
- (void)sendRequestWithValicode:(NSString *)validCode {
    self.apiPath = @"/user/email";
    self.requestDict[@"validCode"] = validCode;
    [self connectWithRquestMethod:HTTPMethodPOST];
}
@end
