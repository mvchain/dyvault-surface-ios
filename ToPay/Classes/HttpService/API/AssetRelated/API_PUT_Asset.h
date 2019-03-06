//
//  API_PUT_Asset.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "ServModel.h"

NS_ASSUME_NONNULL_BEGIN
/*
 {
 "addTokenIdArr": "string",
 "removeTokenIdArr": "string"
 }
 */
@interface API_PUT_Asset : ServModel
- (void)sendRequestWithAddTokenIdArr:(NSString *)addTokenIdArr
                    removeTokenIdArr:(NSString *)removeTokenIdArr;

@end

NS_ASSUME_NONNULL_END
