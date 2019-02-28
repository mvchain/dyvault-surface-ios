//
//  API_POST_Reset.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"
/*
 {
 "email": "string",
 "value": "string"
 }
 */
NS_ASSUME_NONNULL_BEGIN

@interface API_POST_User_Reset : ServModel
- (void)sendRequestWithEmail:(NSString *)email value:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
