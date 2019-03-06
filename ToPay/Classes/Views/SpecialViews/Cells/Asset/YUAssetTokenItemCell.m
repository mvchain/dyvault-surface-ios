//
//  YUAssetTokenItemCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUAssetTokenItemCell.h"
#import "AssetTokenItemModel.h"
@interface YUAssetTokenItemCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *tokenLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *lawCurrencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *tokenCurrencyLabel;

@end


@implementation YUAssetTokenItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.iconImageView yu_circleStyle];

}

- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    AssetTokenItemModel *itemModel = (AssetTokenItemModel*)entity.data;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:itemModel.tokenImage]];
    [self.tokenLabel setText:itemModel.tokenName];
    [self.tokenCurrencyLabel setText:TPString(@"%.4f", yufloat_token(itemModel.value))];
    NSString *moneyFlag = [[YUCurrencyManager shareInstance] nowLegalCurrencyFlag];
    CGFloat nowLawCurrencyRatio = [[YUCurrencyManager shareInstance] nowLegalCurrencyRatio];
    CGFloat lawCureencyValue = yufloat_lawCurrency(itemModel.value * itemModel.ratio / nowLawCurrencyRatio);
    self.lawCurrencyLabel.text = TPString(@"%@ %.2f",moneyFlag,lawCureencyValue );
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
