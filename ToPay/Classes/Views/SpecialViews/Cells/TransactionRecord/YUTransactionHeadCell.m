//
//  YUTransactionHeadCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/7.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUTransactionHeadCell.h"
@interface YUTransactionHeadCell()
@property (weak, nonatomic) IBOutlet UIView *cureencyBgView;
@property (weak, nonatomic) IBOutlet UIView *tokenBgView;
@property (weak, nonatomic) IBOutlet UILabel *currencyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyBalanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *tokenBalanceLabel;

@end

@implementation YUTransactionHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.cureencyBgView yu_circleStyle];
    [self.tokenBgView yu_circleStyle];
    
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
