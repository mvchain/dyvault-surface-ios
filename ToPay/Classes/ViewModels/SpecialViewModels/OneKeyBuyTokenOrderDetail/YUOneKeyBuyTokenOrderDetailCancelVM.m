//
//  YUOneKeyBuyTokenOrderDetailCancelVM.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyBuyTokenOrderDetailCancelVM.h"
#import "YUOneKeyBuyTokenListItemCellEntity.h"
#import "YUUpCricleCellEntity.h"
#import "YUDownCircleCellEntity.h"
#import "YUUnderlineCellEntity.h"
#import "API_GET_Business_Id.h"
#import "OneKeyBuyTokenDetailModel.h"
#import "YUBlueButtonCellEntity.h"
@implementation YUOneKeyBuyTokenOrderDetailCancelVM
- (void)fetchListEntitys:(void(^)(NSMutableArray * entitys,BOOL isSucc,NSString *errInfo))complete {
    
    YUOneKeyBuyTokenListItemCellEntity *sellStatus = [[YUOneKeyBuyTokenListItemCellEntity alloc] init];
    [sellStatus alreadyCancelsStyle];
    sellStatus.leftString = @"出售USDT";
    sellStatus.rightString = @"已取消";
    
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
    
    YUBlueButtonCellEntity *buttonEntity = [[YUBlueButtonCellEntity alloc] init];
    buttonEntity.isDisable = YES;
    buttonEntity.title = @"交易已取消";
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
    [results addObject:[self newDownCircle]];
    [results addObject:[self newBlankWithHeight:169.0]];
    [results addObject:buttonEntity];
    
    API_GET_Business_Id *getBusiness = [[API_GET_Business_Id alloc] init];
    getBusiness.onSuccess = ^(id responseData) {
        NSDictionary *dict = (NSDictionary *)responseData;
        OneKeyBuyTokenDetailModel *detailModel = [[OneKeyBuyTokenDetailModel alloc] initWithDictionary:dict];
        orderNumber.rightString = TPString(@"%.4f %@",yufloat_token(detailModel.amount),detailModel.tokenName);
        orderID.rightString = TPString(@"%@",detailModel.orderNumber);
        buyer.rightString = TPString(@"%@",detailModel.buyUsername);
        unitPrice.rightString = TPString(@"%.4f",yufloat_token(detailModel.price));
        count.rightString = TPString(@"%.4f",yufloat_token(detailModel.tokenValue));
        orderTime.rightString = [QuickGet timeWithTimeInterval_allNumberStyleString:detailModel.createdAt];
        complete(results,YES,nil); // reload tableview
    };
    getBusiness.onError = ^(NSString *reason, NSInteger code) {
        
    };
    getBusiness.onEndConnection = ^{
        
    };
    [getBusiness sendRequestWithIdField:@(self.idfield.integerValue)];
    
}
- (YUBlankCellEntity *)newBlank {
    YUBlankCellEntity *blank =  [[YUBlankCellEntity alloc]init];
    blank.yu_cellHeight = 12.0;
    blank.bgColor = [UIColor qmui_colorWithHexString:@"#F8F8F8"];
    return blank;
}

- (YUBlankCellEntity *)newBlankWithHeight:(CGFloat)height  {
    YUBlankCellEntity *blank =  [[YUBlankCellEntity alloc]init];
    blank.bgColor = [UIColor qmui_colorWithHexString:@"#F8F8F8"];
    blank.yu_cellHeight = height;
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

@end
