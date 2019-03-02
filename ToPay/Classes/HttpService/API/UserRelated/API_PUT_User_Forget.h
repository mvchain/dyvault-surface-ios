//
//  API_PUT_User_Forget.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN
/* change passwd ,type: 1 passwd , 2 paypasswd*/
/* {
 "password": "string",
 "token": "string",
 "type": 0
 }
 */
@interface API_PUT_User_Forget : ServModel
- (void)sendRequestWithPassword:(NSString *)password
                          token:(NSString *)token
                           type:(NSInteger) type
                          email:(NSString *)email;


@end

NS_ASSUME_NONNULL_END
