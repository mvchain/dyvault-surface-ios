//
//  API_GET_Token_Exchange_Rate.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Token_Exchange_Rate.h"

@implementation API_GET_Token_Exchange_Rate
- (void)sendRequest {
    self.apiPath = @"/token/exchange/rate";
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
