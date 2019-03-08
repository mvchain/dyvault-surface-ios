//
//  YUBuyTokenCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/8.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBuyTokenCell.h"
#import "BuyTokenItemModel.h"
@interface YUBuyTokenCell()
@property (weak, nonatomic) IBOutlet UILabel *storeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
@implementation YUBuyTokenCell


- (void)awakeFromNib {
    [super awakeFromNib];
    [self.bgView yu_smallCircleStyle];
    
    // Initialization code
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    BuyTokenItemModel *model = entity.data;
    [self.storeNameLabel setText:model.channelName];
    [self.contactLabel setText:model.contact];
    [self.infoLabel setText:model.info];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
