//
//  YUAssetHeaderInfoCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUAssetHeaderInfoCell.h"
#import "YUAssetHeaderInfoCellEntity.h"
@interface YUAssetHeaderInfoCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UIView *currencyBg;
@property (weak, nonatomic) IBOutlet UIView *buyCurrencyBg;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (weak, nonatomic) IBOutlet UIButton *changeLegalCurrencyButton;
@property (weak, nonatomic) IBOutlet UILabel *buyTokenLabel;


@end

@implementation YUAssetHeaderInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
    // Initialization code
}
- (void)setUp {
    [self.currencyBg yu_circleStyle];
    [self.buyCurrencyBg yu_circleStyle];
    [self.bgView yu_smallCircleStyle];
    self.buyTokenLabel.text = Localized(@"buy_coin");
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    YUAssetHeaderInfoCellEntity *headerEntity = (YUAssetHeaderInfoCellEntity *)entity;
    [self.currencyLabel setText:[YUCurrencyManager shareInstance].nowLegalCurrencyName];
    CGFloat ratio = [[YUCurrencyManager shareInstance] nowLegalCurrencyRatio];
    CGFloat balance = yufloat_lawCurrency(headerEntity.balance / ratio);
    [self.balanceLabel setText:TPString(@"%.2f",balance)];
}
- (IBAction)changeLegalCurrencyTap:(id)sender {
    if (self.yu_delegate) {
        [self.yu_delegate yu_cellMessageNotify:EVENT_ChangeLegalCurrency
                                       content:nil
                                        sender:nil];
        
    }
}
- (IBAction)buyCurrencyTap:(id)sender {
    if (self.yu_delegate) {
        [self.yu_delegate yu_cellMessageNotify:EVENT_BuyCurrency
                                       content:nil
                                        sender:nil];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
