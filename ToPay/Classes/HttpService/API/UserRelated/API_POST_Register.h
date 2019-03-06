//
//  API_POST_Register.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"
// user_register

NS_ASSUME_NONNULL_BEGIN
/*
 {
 email    string

 
 inviteCode    string

 
 nickname    string

 
 password    string

 
 token    string
 
 transactionPassword    string

 
 }
 */
@interface API_POST_Register : ServModel

- (void)sendRequestWithEmail:(NSString *)email
                  inviteCode:(NSString *)inviteCode
                    nickname:(NSString *)nickname
                    password:(NSString *)password
                        salt:(NSString *)salt
                       token:(NSString *)token
         transactionPassword:(NSString *)transactionPassword;

@end

NS_ASSUME_NONNULL_END
