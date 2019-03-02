//
//  API_GET_Asset.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_Asset.h"

@implementation API_GET_Asset
- (void)sendRequest {
    self.apiPath = @"/asset";
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
