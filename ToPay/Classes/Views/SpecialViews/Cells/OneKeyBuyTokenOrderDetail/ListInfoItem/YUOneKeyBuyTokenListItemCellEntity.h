//
//  YUOneKeyBuyTokenListItemCellEntity.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUCellEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface YUOneKeyBuyTokenListItemCellEntity : YUCellEntity
@property (copy,nonatomic) NSString *leftString ;
@property (copy,nonatomic) NSString *rightString ;
@property (strong,nonatomic) UIColor *leftColor ;
@property (strong,nonatomic) UIColor *rightColor;
@property (strong,nonatomic) UIFont *leftFont;
@property (strong,nonatomic) UIFont *rightFont;
- (void)alreadyReceivablesStyle;
- (void)alreadyCancelsStyle;
- (void)watingStyle;
- (void)smallGrayItemStyle;
- (void)orderCashNumberStyle;
- (void)remainReceiptTimeStyle;
- (void)alreadyComplete;




@end

NS_ASSUME_NONNULL_END
