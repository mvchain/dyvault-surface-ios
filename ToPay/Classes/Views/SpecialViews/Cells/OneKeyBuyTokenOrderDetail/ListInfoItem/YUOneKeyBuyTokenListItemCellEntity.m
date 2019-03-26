//
//  YUOneKeyBuyTokenListItemCellEntity.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyBuyTokenListItemCellEntity.h"

@implementation YUOneKeyBuyTokenListItemCellEntity

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.yu_cellHeight = 36.0;
        
    }
    return self;
}

- (void)alreadyReceivablesStyle {
    self.leftFont = [UIFont systemFontOfSize:13];
    self.leftColor = [UIColor qmui_colorWithHexString:@"#8E8E9E"];
    self.rightFont = [UIFont systemFontOfSize:17];
    self.rightColor = [UIColor qmui_colorWithHexString:@"#24B24A"];
    
}

- (void)alreadyCancelsStyle {
    self.leftFont = [UIFont systemFontOfSize:13];
    self.leftColor = [UIColor qmui_colorWithHexString:@"#8E8E9E"];
    self.rightFont = [UIFont systemFontOfSize:17];
    self.rightColor = [UIColor qmui_colorWithHexString:@"#DEDEDE"];
}

- (void)watingStyle {
    self.leftFont = [UIFont systemFontOfSize:13];
    self.leftColor = [UIColor qmui_colorWithHexString:@"#8E8E9E"];
    self.rightFont = [UIFont systemFontOfSize:17];
    self.rightColor = [UIColor qmui_colorWithHexString:@"#FF4600"];
}

- (void)smallGrayItemStyle {
    self.leftFont = [UIFont systemFontOfSize:13];
    self.leftColor = [UIColor qmui_colorWithHexString:@"#B9B9B9"];
    self.rightFont = [UIFont systemFontOfSize:13];
    self.rightColor = [UIColor qmui_colorWithHexString:@"#B9B9B9"];
}

- (void)orderCashNumberStyle {
    self.leftFont = [UIFont systemFontOfSize:13];
    self.leftColor = [UIColor qmui_colorWithHexString:@"#B9B9B9"];
    self.rightFont = [UIFont systemFontOfSize:16];
    self.rightColor = [UIColor qmui_colorWithHexString:@"#666666"];
}

- (void)remainReceiptTimeStyle {
 
    self.leftFont = [UIFont systemFontOfSize:13];
    self.leftColor = [UIColor qmui_colorWithHexString:@"#8E8E9E"];
    self.rightFont = [UIFont systemFontOfSize:18];
    self.rightColor = [UIColor qmui_colorWithHexString:@"#595971"];
  
}


@end
