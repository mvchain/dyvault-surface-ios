//
//  YUTransactionDetailViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/8.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBaseViewController.h"
#import "TransactionRecordModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface YUTransactionDetailViewController : YUBaseViewController
@property (strong,nonatomic) TransactionRecordModel *transactionRecordModel ;

@end

NS_ASSUME_NONNULL_END
