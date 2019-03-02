//
//  YUAssetHeaderInfoCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUAssetHeaderInfoCell.h"

@interface YUAssetHeaderInfoCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UIView *currencyBg;
@property (weak, nonatomic) IBOutlet UIView *buyCurrencyBg;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
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
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
