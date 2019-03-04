//
//  YULanguageItemCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YULanguageItemCell.h"
@interface YULanguageItemCell()
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation YULanguageItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.bgView yu_smallCircleStyle];
    
    // Initialization code
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    if (entity.data) {
        [self.infoLabel setText:(NSString *)entity.data];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
