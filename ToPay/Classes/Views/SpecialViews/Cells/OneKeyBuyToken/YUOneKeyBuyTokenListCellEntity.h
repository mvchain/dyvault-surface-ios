//
//  YUOneKeyBuyTokenListCellEntity.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUCellEntity.h"

NS_ASSUME_NONNULL_BEGIN


@class OneKeyBuyTokenListItem;
@interface YUOneKeyBuyTokenListCellEntity : YUCellEntity
@property (copy,nonatomic) NSString *tokenName ;
@property (copy,nonatomic) NSString *lawCurrencyName ;
@property (copy,nonatomic) NSString *orderId ;
@property (assign,nonatomic) CGFloat price ;
@property (assign,nonatomic) NSUInteger unixTime;
@property (assign,nonatomic) OneKeyBuyTokenStatus status ;

- (instancetype)initWithOneKeyBuyTokenListItem:(OneKeyBuyTokenListItem *)itemModel;

@end

NS_ASSUME_NONNULL_END
