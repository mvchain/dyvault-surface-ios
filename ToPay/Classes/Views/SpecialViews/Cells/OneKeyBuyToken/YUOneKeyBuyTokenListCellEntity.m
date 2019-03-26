//
//  YUOneKeyBuyTokenListCellEntity.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyBuyTokenListCellEntity.h"
#import "OneKeyBuyTokenListItem.h"
@implementation YUOneKeyBuyTokenListCellEntity
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.yu_cellHeight = 138.0;
    }
    return self;
}
- (instancetype)initWithOneKeyBuyTokenListItem:(OneKeyBuyTokenListItem *)itemModel {
    self = [super init];
    
    if (self) {
        self.yu_cellHeight = 138.0;
        self.data = itemModel;
        self.tokenName = itemModel.tokenName;
        self.price = itemModel.amount;
        self.orderId = itemModel.orderNumber;
        self.lawCurrencyName = @"CNY";
        // orderStatus 0:wait 1:payed 2:complete 4:cancel 9:fail
        switch (itemModel.orderStatus) {
            case 0:
            {
                self.status = OneKeyBuyTokenStatusWaitingReceivables;
            }
                break;
            case 1:
            {
                self.status = OneKeyBuyTokenStatusAlreadyReceivables;
            }
                break;
            case 2:
            {
                self.status = OneKeyBuyTokenStatusAlreadyComplete;
            }
                break;
            case 4:
            {
                self.status = OneKeyBuyTokenStatusAlreadyCancle;
            }
                break;
            case 9:
            {
                self.status = OneKeyBuyTokenStatusWaitingReceivables;
            }
                break;
            default:
                break;
        }
    }
    return self;
}
@end
