//
//  API_POST_Reset.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_POST_User_Reset.h"

@implementation API_POST_User_Reset
- (void)sendRequestWithEmail:(NSString *)email value:(NSString *)value {
    self.apiPath = @"/user/reset";
    self.requestDict[@"email"] = email;
    self.requestDict[@"value"] = value;
    [self connectWithRquestMethod:HTTPMethodPOST];
    
}
@end
