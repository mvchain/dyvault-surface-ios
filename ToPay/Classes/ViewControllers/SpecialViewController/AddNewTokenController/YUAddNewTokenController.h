//
//  YUAddNewTokenController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBaseViewController.h"
@class AssetTokenItemModel;

NS_ASSUME_NONNULL_BEGIN

@interface YUAddNewTokenController : YUBaseViewController
@property (strong,nonatomic) NSMutableArray <AssetTokenItemModel *> *alreadyAssetItems;
@end

NS_ASSUME_NONNULL_END
