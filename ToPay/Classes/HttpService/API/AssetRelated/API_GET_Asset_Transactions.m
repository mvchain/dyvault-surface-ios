//
//  API_GET_Asset_Transactions.m
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Asset_Transactions.h"

@implementation API_GET_Asset_Transactions
- (void)sendRequestWithID:(NSInteger)idField
                 pageSize:(NSInteger)pageSize
                  tokenId:(NSInteger)tokenId
          transactionType:(NSInteger)transactionType {
    self.apiPath = @"/asset/transactions";
    self.requestDict[@"id"] = @(idField);
    self.requestDict[@"pageSize"] = @(pageSize);
    self.requestDict[@"tokenId"] = @(tokenId);
    self.requestDict[@"transactionType"] = @(transactionType);
    [self connectWithRquestMethod:HTTPMethodGET];
    
}
@end
