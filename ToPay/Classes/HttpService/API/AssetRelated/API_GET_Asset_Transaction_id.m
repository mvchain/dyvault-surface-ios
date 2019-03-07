//
//  API_GET_Asset_Transaction_id.m
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Asset_Transaction_id.h"

@implementation API_GET_Asset_Transaction_id
- (void)sendRequestWithID:(NSInteger)idField {
    self.apiPath = TPString(@"/asset/transaction/%@",@(idField));
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
