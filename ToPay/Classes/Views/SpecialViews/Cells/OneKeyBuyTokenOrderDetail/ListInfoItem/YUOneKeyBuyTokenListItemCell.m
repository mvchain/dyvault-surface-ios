//
//  YUOneKeyBuyTokenListItemCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyBuyTokenListItemCell.h"
#import "YUOneKeyBuyTokenListItemCellEntity.h"
@interface YUOneKeyBuyTokenListItemCell()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation YUOneKeyBuyTokenListItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    YUOneKeyBuyTokenListItemCellEntity *myEntity = (YUOneKeyBuyTokenListItemCellEntity *)entity;
    [self.leftLabel setText:myEntity.leftString];
    [self.leftLabel setTextColor:myEntity.leftColor];
    [self.leftLabel setFont:myEntity.leftFont];
    [self.rightLabel setText:myEntity.rightString];
    [self.rightLabel setTextColor:myEntity.rightColor];
    [self.rightLabel setFont:myEntity.rightFont];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
