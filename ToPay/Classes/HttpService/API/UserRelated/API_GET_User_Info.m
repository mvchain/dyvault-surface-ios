//
//  API_GET_User_Info.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_User_Info.h"

@implementation API_GET_User_Info
- (void)sendRequest {
    self.apiPath = @"/user/info";
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
