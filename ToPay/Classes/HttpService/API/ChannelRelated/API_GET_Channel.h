//
//  API_GET_Channel.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/8.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface API_GET_Channel : ServModel
- (void)sendRequestWithId:(NSInteger)idField
                 pageSize:(NSInteger)pageSize ;

@end

NS_ASSUME_NONNULL_END
