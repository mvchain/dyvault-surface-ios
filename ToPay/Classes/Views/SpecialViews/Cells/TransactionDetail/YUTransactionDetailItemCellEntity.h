//
//  YUTransactionDetailItemCellEntity.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/8.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUCellEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface YUTransactionDetailItemCellEntity : YUCellEntity
@property (copy,nonatomic) NSString *leftTitleStr ;
@property (copy,nonatomic) NSString *rightTitleStr ;
@property (strong,nonatomic) UIFont *rightFont;
@property (strong,nonatomic) UIColor *rightTextColor;

@end

NS_ASSUME_NONNULL_END
