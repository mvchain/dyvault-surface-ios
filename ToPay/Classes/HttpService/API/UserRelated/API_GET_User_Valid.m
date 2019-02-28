//
//  API_GET_User_Valid.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_User_Valid.h"

@implementation API_GET_User_Valid
- (void)sendRequestWithEmail:(NSString *)email {
    self.apiPath = @"/user/valid";
    self.requestDict[@"email"] = email;
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
