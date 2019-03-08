//
//  API_POST_Asset_Transaction.m
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_POST_Asset_Transaction.h"

@implementation API_POST_Asset_Transaction
- (void)sendRequestWithAddress:(NSString *)address
                      password:(NSString *)password
                       tokenId:(NSInteger)tokenId
                         value:(CGFloat)value {
    NSString *salt = [YUUserManagers shareInstance].userIDCard_inDisk.salt;
    self.apiPath = @"/asset/transaction";
    self.requestDict[@"address"] = address;
    self.requestDict[@"password"] = [QuickGet encryptPwd:password salt:salt];
    self.requestDict[@"tokenId"] = @(tokenId);
    self.requestDict[@"value"] = @(value);
    [self connectWithRquestMethod:HTTPMethodPOST];
}
@end
