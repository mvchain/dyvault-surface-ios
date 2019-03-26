//
//  YUOneKeyBuyTokenOrderDetailAlreadyReceiptlVM.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyBuyTokenOrderDetailAlreadyReceiptlVM.h"
#import "YUOneKeyBuyTokenListItemCellEntity.h"
#import "YUUpCricleCellEntity.h"
#import "YUDownCircleCellEntity.h"
#import "YUUnderlineCellEntity.h"
@implementation YUOneKeyBuyTokenOrderDetailAlreadyReceiptlVM
- (void)fetchListEntitys:(void(^)(NSMutableArray * entitys,BOOL isSucc,NSString *errInfo))complete {
    
    YUOneKeyBuyTokenListItemCellEntity *sellStatus = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [sellStatus alreadyReceivablesStyle];
    sellStatus.leftString = @"出售USDT";
    sellStatus.rightString = @"已收款";
    
    
    YUOneKeyBuyTokenListItemCellEntity *orderNumber = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [orderNumber orderCashNumberStyle];
    orderNumber.leftString = @"订单金额";
    orderNumber.rightString = @"1234.00 USDT";
    
    YUOneKeyBuyTokenListItemCellEntity *orderID = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [orderID smallGrayItemStyle];
    orderID.leftString = @"订单号";
    orderID.rightString = @"1261654";
    
    YUOneKeyBuyTokenListItemCellEntity *buyer = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [buyer smallGrayItemStyle];
    buyer.leftString = @"买家";
    buyer.rightString = @"hello";
    
    YUOneKeyBuyTokenListItemCellEntity *unitPrice = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [unitPrice smallGrayItemStyle];
    unitPrice.leftString = @"单价";
    unitPrice.rightString = @"272 CNY";
    
    YUOneKeyBuyTokenListItemCellEntity *count = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [count smallGrayItemStyle];
    count.leftString = @"数量";
    count.rightString = @"27028.00";
    
    YUOneKeyBuyTokenListItemCellEntity *orderTime = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [orderTime smallGrayItemStyle];
    orderTime.leftString = @"下单时间";
    orderTime.rightString = @"27028.00";
    
    YUOneKeyBuyTokenListItemCellEntity *payWay = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [payWay smallGrayItemStyle];
    payWay.leftString = @"买家付款方式";
    payWay.rightString = @"银行卡";
    
    YUOneKeyBuyTokenListItemCellEntity *payAccount = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [payAccount smallGrayItemStyle];
    payAccount.leftString = @"买家付款账户";
    payAccount.rightString = @"6220 11502 123";

    NSMutableArray *results = [[NSMutableArray alloc] init];
    [results addObject:[self newBlank]];
    [results addObject:[self newUpCircle]];
    [results addObject:sellStatus];
    [results addObject:[self newDownCircle]];
    [results addObject:[self newBlank]];
    [results addObject:[self newUpCircle]];
    [results addObject:orderNumber];
    [results addObject:orderID];
    [results addObject:buyer];
    [results addObject:unitPrice];
    [results addObject:count];
    [results addObject:orderTime];
    [results addObject:[self newUnderLine]];
    [results addObject:payWay];
    [results addObject:payAccount];
    [results addObject:[self newDownCircle]];
    complete(results,YES,nil);
}
- (YUBlankCellEntity *)newBlank {
    YUBlankCellEntity *blank =  [[YUBlankCellEntity alloc]init];
    blank.yu_cellHeight = 12.0;
    blank.bgColor = [UIColor qmui_colorWithHexString:@"#F8F8F8"];
    return blank;
}

- (YUCellEntity *)newUpCircle {
    YUUpCricleCellEntity *upCircle = [[YUUpCricleCellEntity alloc] init];
    return upCircle;
    
}
- (YUCellEntity *)newDownCircle {
    YUDownCircleCellEntity *downCircle = [[YUDownCircleCellEntity alloc] init];
    return downCircle;
}

- (YUCellEntity *)newUnderLine {
    YUUnderlineCellEntity *underLine = [[YUUnderlineCellEntity alloc] init];
    return underLine;
    
}

@end