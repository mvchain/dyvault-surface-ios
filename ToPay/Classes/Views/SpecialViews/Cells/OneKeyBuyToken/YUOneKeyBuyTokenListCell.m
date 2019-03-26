//
//  YUOneKeyBuyTokenListCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyBuyTokenListCell.h"
#import "YUOneKeyBuyTokenListCellEntity.h"
@interface YUOneKeyBuyTokenListCell()
@property (weak, nonatomic) IBOutlet UILabel *tokenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation YUOneKeyBuyTokenListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.bgView yu_smallCircleStyle];
    
    // Initialization code
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    YUOneKeyBuyTokenListCellEntity *myEntity = (YUOneKeyBuyTokenListCellEntity *)entity;
    [self.tokenNameLabel setText:TPString(@"购买%@",myEntity.tokenName)];
    [self.priceLabel setText:TPString(@"%.2f %@",yufloat_lawCurrency(myEntity.price),myEntity.lawCurrencyName)];
    [self.timeLabel setText:[QuickGet timeWithTimeInterval_allNumberStyleString:myEntity.unixTime]];
    [self setStatusUIByStatus:myEntity.status];
    [self.orderIdLabel setText:myEntity.orderId];
    
}
- (void)setStatusUIByStatus:(OneKeyBuyTokenStatus) status {
    switch (status) {
        case OneKeyBuyTokenStatusAlreadyReceivables:
        {
            [self.statusLabel setText:@"已收款"];
            [self.statusLabel setTextColor:[UIColor qmui_colorWithHexString:@"#24B24A"]];
            self.bgView.backgroundColor = [UIColor whiteColor];
        }
            break;
        case OneKeyBuyTokenStatusAlreadyCancle:
        {
            [self.statusLabel setText:@"已取消"];
            [self.statusLabel setTextColor:[UIColor qmui_colorWithHexString:@"#C7C7C7"]];
            self.bgView.backgroundColor = [UIColor qmui_colorWithHexString:@"#F1F1F1"];
        }
            break;
        case OneKeyBuyTokenStatusAlreadyComplete:
        {
            [self.statusLabel setText:@"已完成"];
            [self.statusLabel setTextColor:[UIColor qmui_colorWithHexString:@"#555555"]];
            self.bgView.backgroundColor = [UIColor whiteColor];
        }
            break;
        case OneKeyBuyTokenStatusWaitingReceivables:
        {
            [self.statusLabel setText:@"待收款"];
            [self.statusLabel setTextColor:[UIColor qmui_colorWithHexString:@"#FF4600"]];
            self.bgView.backgroundColor = [UIColor whiteColor];
        }
            break;
        default:
            break;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
