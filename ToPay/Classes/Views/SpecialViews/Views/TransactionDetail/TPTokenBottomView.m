//
//  TPTokenBottomView.m
//  ToPay
//
//  Created by 蒲公英 on 2018/11/19.
//  Copyright © 2018年 蒲公英. All rights reserved.
//

#import "TPTokenBottomView.h"

@interface TPTokenBottomView ()

@property (nonatomic) TPChainStyle style;
@property (nonatomic) UIButton * takeOutBtn;
@end
@implementation TPTokenBottomView
- (instancetype)initWithStyle:(TPChainStyle)style
{
    self = [super init];
    if (self)
    {
        _style = style;
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createUI];
    }
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
    
}
- (void)createUI
{
    UIButton *transferBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *ima = [QuickGet getImageByColor:[UIColor qmui_colorWithHexString:@"#FF3A96FF"]];
    [transferBtn setBackgroundImage:ima forState:UIControlStateNormal];
    [transferBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [transferBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [transferBtn addTarget:self action:@selector(transferClcik) forControlEvents:UIControlEventTouchUpInside];
    [transferBtn setTitle:@"转账" forState:UIControlStateNormal];
    [self addSubview:transferBtn];
    self.transferBtn = transferBtn;
    
    UIButton *receiptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [receiptBtn yu_circleStyle];
    UIImage *ima2 = [QuickGet getImageByColor:[UIColor qmui_colorWithHexString:@"#FF6468F2"]];
    [receiptBtn setBackgroundImage:ima2 forState:UIControlStateNormal];
    [receiptBtn setTitle:@"收款" forState:UIControlStateNormal];
    [receiptBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [receiptBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [receiptBtn addTarget:self action:@selector(receiptClcik) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:receiptBtn];
    self.receiptBtn = receiptBtn;
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self.transferBtn];
    [array addObject:self.receiptBtn];
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:11 leadSpacing:16 tailSpacing:16];
    [array mas_makeConstraints:^(MASConstraintMaker *make)
    {
             make.top.equalTo(@6);
             make.height.equalTo(@44);
    }];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.transferBtn yu_circleStyle];
    [self.receiptBtn yu_circleStyle];
}
- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    [self.transferBtn setTitle:titleArray[0] forState:UIControlStateNormal];
    [self.receiptBtn setTitle:titleArray[1] forState:UIControlStateNormal];
}

- (void)transferClcik
{
    if (self.chainTransferBlock)
    {
        self.chainTransferBlock();
    }
}
- (void)receiptClcik
{
    if (self.chainReceiptBlock)
    {
        self.chainReceiptBlock();
    }
}
@end
