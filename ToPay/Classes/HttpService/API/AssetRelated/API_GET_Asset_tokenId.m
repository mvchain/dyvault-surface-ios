//
//  API_GET_Asset_tokenId.m
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Asset_tokenId.h"

@implementation API_GET_Asset_tokenId
- (void)sendRequestWithTokenId:(NSUInteger)tokenId {
    self.apiPath = TPString(@"/asset/%@",@(tokenId));
    [self connectWithRquestMethod:HTTPMethodGET];
    
}
@end
