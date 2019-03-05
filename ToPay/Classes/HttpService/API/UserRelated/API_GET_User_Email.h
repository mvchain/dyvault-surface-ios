//
//  API_GET_User_Email.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN
/* don't need input email ,use current token  */
@interface API_GET_User_Email : ServModel
- (void)sendRequest;

@end

NS_ASSUME_NONNULL_END
