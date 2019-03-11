//
//  API_GET_App.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/11.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_GET_App.h"

@implementation API_GET_App

- (void)sendRequest {
    self.apiPath = @"/app";
    self.requestDict[@"appType"] = @"ipa";
    [self connectWithRquestMethod:HTTPMethodGET];
}
@end
