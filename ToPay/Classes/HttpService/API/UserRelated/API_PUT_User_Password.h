//
//  API_PUT_User_Password.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN
/*
 {
 newPassword    string

 
 password    string
 
 
 }
 */
@interface API_PUT_User_Password : ServModel
- (void)sendRequestWithNewPassword:(NSString *)newPassword
                          password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
