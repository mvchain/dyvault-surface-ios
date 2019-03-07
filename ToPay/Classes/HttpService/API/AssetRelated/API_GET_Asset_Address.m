//
//  API_GET_Asset_Address.m
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Asset_Address.h"

@implementation API_GET_Asset_Address
- (void)sendRequestWithTokenId:(NSInteger)tokenId {
    self.apiPath = @"/asset/address";
    self.requestDict[@"tokenId"] = @(tokenId);
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
