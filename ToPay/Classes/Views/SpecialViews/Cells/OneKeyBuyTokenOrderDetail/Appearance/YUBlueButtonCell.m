//
//  YUBlueButtonCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/30.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBlueButtonCell.h"
#import "YUBlueButtonCellEntity.h"
@interface YUBlueButtonCell()
@property (weak, nonatomic) IBOutlet UIButton *button;
@end
@implementation YUBlueButtonCell
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.button yu_gradualBlueChangeStyle];
}
- (IBAction)tap:(id)sender {
    [self.yu_delegate yu_cellMessageNotify:@"buttonTap" content:nil sender:self.button];
}

- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    YUBlueButtonCellEntity *myEn = (YUBlueButtonCellEntity *)entity ;
    self.button.enabled = !myEn.isDisable;
    [self.button setTitle:myEn.title forState:UIControlStateNormal];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
