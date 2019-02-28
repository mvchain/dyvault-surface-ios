//
//  API_POST_User.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface API_POST_User : ServModel

/*
 appuserRegCheckDTO
 Example Value
 Model
 {
 "email": "string",
 "inviteCode": "string",
 "validCode": "string"
 

 */
/*  checkout validcode，when register */
- (void)sendRequestWithEmail:(NSString *)email
                  inviteCode:(NSString *)inviteCode
                   validCode:(NSString *)validCode ;

@end

NS_ASSUME_NONNULL_END
