//
//  API_GET_Assest_Balance.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Asset_Balance.h"

@implementation API_GET_Asset_Balance
- (void)sendRequest {
    self.apiPath = @"/asset/balance";
    [self connectWithRquestMethod:HTTPMethodGET];
    
}
@end
