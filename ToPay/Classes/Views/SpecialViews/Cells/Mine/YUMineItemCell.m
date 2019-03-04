//
//  YUMineItemCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUMineItemCell.h"
@interface YUMineItemCell()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *minTitleLabel;
@end

@implementation YUMineItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.bgView yu_smallCircleStyle];
    
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    if (entity.data) {
        [self.minTitleLabel setText:(NSString *)entity.data];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
