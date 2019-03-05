//
//  API_POST_User_Email.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN
// valid msg code, the first step of rebind email
@interface API_POST_User_Email : ServModel
- (void)sendRequestWithValicode:(NSString *)validCode;

@end

NS_ASSUME_NONNULL_END
