//
//  YUTransferViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/7.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBaseViewController.h"
#import "AssetTokenItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface YUTransferViewController : YUBaseViewController
@property (weak,nonatomic) AssetTokenItemModel *assetTokenModel ;
@property (copy,nonatomic) NSString *defaultAddress;

@end

NS_ASSUME_NONNULL_END
