//
//  API_POST_User_Login.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"
/*
 {
 "imageToken": "string",
 "password": "string",
 "username": "string",
 "validCode": "string"
 }
 */
NS_ASSUME_NONNULL_BEGIN
@interface API_POST_User_Login : ServModel
- (void)sendRequestWithImageToken:(NSString *)imageToken
                         password:(NSString *)password
                         username:(NSString *)username
                        validCode:(NSString *)validCode;

@end
NS_ASSUME_NONNULL_END
