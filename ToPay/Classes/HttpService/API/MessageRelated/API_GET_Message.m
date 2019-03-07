//
//  API_GET_Message.m
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Message.h"

@implementation API_GET_Message
- (void)sendReuqestWithPageSize:(NSUInteger)pageSize
                      timestamp:(NSUInteger)timestamp {
    self.apiPath = @"/message";
    self.requestDict[@"pageSize"] = @(pageSize);
    self.requestDict[@"timestamp"] = @(timestamp);
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
