//
//  API_GET_Token.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Token.h"

@implementation API_GET_Token
- (void)sendRequest {
    self.apiPath = @"/token";
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
