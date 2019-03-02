//
//  YUAddNewTokenItemCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/2.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUAddNewTokenItemCell.h"
#import "YUAddNewTokenItemCellEntity.h"
#import "AddNewTokenItemModel.h"
@interface YUAddNewTokenItemCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *tokenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tokenDescLabel;
@property (weak, nonatomic) IBOutlet UIView *addOrDeleteBgView;
@property (weak, nonatomic) IBOutlet UILabel *addOrDeleteTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *addOrDeleteButton;

@end
@implementation YUAddNewTokenItemCell



- (void)awakeFromNib {
    [super awakeFromNib];
    [self.bgView yu_smallCircleStyle];
    [self.addOrDeleteBgView yu_smallCircleStyle];
    [self.iconImageView yu_smallCircleStyle];
    
    // Initialization code
}
- (void) setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    YUAddNewTokenItemCellEntity *thisEntity = (YUAddNewTokenItemCellEntity *)entity;
    AddNewTokenItemModel *model = (AddNewTokenItemModel *)entity.data;
    [self.tokenNameLabel setText:model.tokenName];
    [self.tokenDescLabel setText:TPString(@"%@/%@",model.tokenCnName,model.tokenEnName)];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.tokenImage]];
    if (thisEntity.isAdd) {
        [self addNew_Style];
    }else {
        [self delete_Style];
    }
}
- (void)addNew_Style {
    self.addOrDeleteBgView.backgroundColor = [UIColor whiteColor];
    [self.addOrDeleteTextLabel setText:@"添加"];
    
}
- (void)delete_Style {
    self.addOrDeleteBgView.backgroundColor = [UIColor qmui_colorWithHexString:@"#FFD1D2DE"];
    [self.addOrDeleteTextLabel setText:@"删除"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
