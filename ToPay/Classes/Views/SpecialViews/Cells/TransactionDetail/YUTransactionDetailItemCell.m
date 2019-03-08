//
//  YUTransactionDetailItemCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/8.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUTransactionDetailItemCell.h"
#import "YUTransactionDetailItemCellEntity.h"
#import "TransactionRecordModel.h"
@interface YUTransactionDetailItemCell()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@end

@implementation YUTransactionDetailItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    YUTransactionDetailItemCellEntity *myEntity = (YUTransactionDetailItemCellEntity *)entity ;
    [self.leftLabel setText:myEntity.leftTitleStr];
    [self.rightLabel setFont:myEntity.rightFont];
    [self.rightLabel setTextColor:myEntity.rightTextColor];
    [self.rightLabel setText:myEntity.rightTitleStr];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
