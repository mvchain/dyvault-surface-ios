//
//  API_GET_User_Valid.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface API_GET_User_Valid : ServModel
- (void)sendRequestWithEmail:(NSString *)email;
@end

NS_ASSUME_NONNULL_END
