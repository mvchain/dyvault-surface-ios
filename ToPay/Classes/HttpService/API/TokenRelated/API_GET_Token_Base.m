//
//  API_GET_Token_Base.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Token_Base.h"

@implementation API_GET_Token_Base
- (void)sendRequest {
    self.apiPath = @"token/base";
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
