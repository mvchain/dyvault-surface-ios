//
//  API_GET_Channel.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/8.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Channel.h"

@implementation API_GET_Channel
- (void)sendRequestWithId:(NSInteger)idField
                 pageSize:(NSInteger)pageSize {
    self.apiPath = @"/channel";
    self.requestDict[@"id"] = @(idField);
    self.requestDict[@"pageSize"] = @(pageSize);
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
