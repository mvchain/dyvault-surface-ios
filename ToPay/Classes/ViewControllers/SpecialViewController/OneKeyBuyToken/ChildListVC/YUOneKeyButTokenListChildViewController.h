//
//  YUOneKeyButTokenListChildViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YUOneKeyButTokenListChildViewController : YUBaseViewController
@property (copy,nonatomic) void(^selectedCallBack) (id itemModel);
@property (assign,nonatomic) NSInteger status ; //business order status, 1 started 2 complete 4 cancel 0 all

@end

NS_ASSUME_NONNULL_END
