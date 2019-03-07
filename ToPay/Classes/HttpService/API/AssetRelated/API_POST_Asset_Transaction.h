//
//  API_POST_Asset_Transaction.h
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"
/*
 {
 "address": "string",
 "password": "string",
 "tokenId": 0,
 "value": 0
 }
 */
@interface API_POST_Asset_Transaction : ServModel
- (void)sendRequestWithAddress:(NSString *)address
                      password:(NSString *)password
                       tokenId:(NSInteger)tokenId
                         value:(CGFloat)value;
@end
