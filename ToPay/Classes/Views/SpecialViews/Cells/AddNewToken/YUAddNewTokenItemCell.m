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
    NSString *tokenName_language = [[YULanguageManagers shareInstance] tokenFullNameByTokenName:model.tokenName];
    [self.tokenDescLabel setText:tokenName_language];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.tokenImage] placeholderImage:[UIImage imageNamed:@"head"]];
    if (thisEntity.isShowAddButton) {
        [self showAddOrDeleteButton];
        if (thisEntity.isAdd) {
            [self addNew_Style];
        }else {
            [self delete_Style];
        }
    }else {
        [self hideAddOrDeleteButton];
    }
}
- (IBAction)AddOrDeleteButtonTap:(id)sender {
    [self.yu_delegate yu_cellMessageNotify:nil content:self.entity sender:sender];
}
- (void)addNew_Style {
    self.addOrDeleteBgView.backgroundColor = [UIColor whiteColor];
    [self.addOrDeleteTextLabel setText:Localized(@"add")];
}
- (void)delete_Style {
    self.addOrDeleteBgView.backgroundColor = [UIColor qmui_colorWithHexString:@"#FFD1D2DE"];
    [self.addOrDeleteTextLabel setText:Localized(@"delete")];
}

- (void)hideAddOrDeleteButton {
    self.addOrDeleteButton.hidden = YES;
    self.addOrDeleteTextLabel.hidden = YES;
    self.addOrDeleteBgView.hidden = YES;
    
}
- (void)showAddOrDeleteButton {
    self.addOrDeleteButton.hidden = NO;
    self.addOrDeleteTextLabel.hidden = NO;
    self.addOrDeleteBgView.hidden = NO;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
