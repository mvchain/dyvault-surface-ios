//
//  YUTransactionListViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/7.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class AssetTokenItemModel;
@class TransactionRecordModel;
@interface YUTransactionListViewController : UIViewController
@property (assign,nonatomic) NSInteger transactionType;
@property (weak, nonatomic) AssetTokenItemModel *assetTokenModel;
@property (copy,nonatomic) void(^selectedCallBack) (TransactionRecordModel *recordItemModel);
- (void)refreshData;

@end

NS_ASSUME_NONNULL_END
