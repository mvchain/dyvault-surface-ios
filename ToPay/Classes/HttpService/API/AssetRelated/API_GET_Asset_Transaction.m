//
//  API_GET_Asset_Transaction.m
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Asset_Transaction.h"

@implementation API_GET_Asset_Transaction
- (void)sendRequestWithTokenId:(NSInteger)tokenId {
    self.apiPath = @"/asset/transaction";
    self.requestDict[@"tokenId"] = @(tokenId);
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
