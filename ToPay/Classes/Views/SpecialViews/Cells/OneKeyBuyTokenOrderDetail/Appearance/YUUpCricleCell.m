//
//  YUUpCricleCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUUpCricleCell.h"

@interface YUUpCricleCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@end

@implementation YUUpCricleCell
- (void)awakeFromNib {
    [super awakeFromNib];
    [_bgView yu_smallCircleStyle];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
