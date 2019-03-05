//
//  API_PUT_User_Email.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface API_PUT_User_Email : ServModel
- (void)sendRequestWithEmail:(NSString *)email
                       token:(NSString *)token
                    validcode:(NSString *)validcode;

@end

NS_ASSUME_NONNULL_END
