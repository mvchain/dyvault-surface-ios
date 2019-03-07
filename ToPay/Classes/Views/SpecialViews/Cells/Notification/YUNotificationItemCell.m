//
//  YUNotificationItemCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUNotificationItemCell.h"
#import "MessageItemModel.h"
@interface YUNotificationItemCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@end
@implementation YUNotificationItemCell
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.bgView yu_smallCircleStyle];
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    MessageItemModel *model = (MessageItemModel *)entity.data ;
    self.contentLabel.text = model.message;
    self.timeLabel.text = [QuickGet timeWithTimeInterval_allNumberStyleString:model.createdAt];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
