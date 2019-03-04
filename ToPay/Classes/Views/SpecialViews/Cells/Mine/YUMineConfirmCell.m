//
//  YUMineConfirmCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUMineConfirmCell.h"
@interface YUMineConfirmCell()
@property (weak, nonatomic) IBOutlet UIButton *logoOutButton;
@end
@implementation YUMineConfirmCell
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.logoOutButton yu_gradualBlueChangeStyle];
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    if (entity.data) {
        [self.logoOutButton setTitle:(NSString *)entity.data forState:UIControlStateNormal];
    }
}
- (IBAction)logoutBtnTap:(id)sender {
    if (self.entity.callBackByCell) {
        self.entity.callBackByCell(nil);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
