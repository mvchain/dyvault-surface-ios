//
//  API_GET_Asset_tokenId.h
//  ToPay
//
//  Created by 叶夏云 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

@interface API_GET_Asset_tokenId : ServModel
- (void)sendRequestWithTokenId:(NSUInteger)tokenId;

@end
