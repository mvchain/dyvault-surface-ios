//
//  YUTransactionRecordCell.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/7.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUTransactionRecordCell.h"
#import "AssetTokenItemModel.h"
#import "TransactionRecordModel.h"
typedef void(^void_block)(void);

@interface YUTransactionRecordCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *cashNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation YUTransactionRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}
- (void)setEntity:(YUCellEntity *)entity {
    [super setEntity:entity];
    // classify 0 :block transaction ,5 inner transaction
    // transactionType 1: in ,2:out
   
    TransactionRecordModel *itemModel = (TransactionRecordModel *)entity.data;
    self.timeLabel.text = [QuickGet timeWithTimeInterval_allNumberStyleString:itemModel.createdAt];
    NSArray<void_block> *classify_mapTo_Block = @[^(void){
        // classify equal 0,block transaction
        NSArray *status_mapTo_Str = @[@"",@"等待中",@"成功",@"",@"",@"",@"",@"",@"",@"失败"];
        NSString *statusStr = status_mapTo_Str[itemModel.status];
        [self.statusLabel setHidden:NO];
        NSArray<void_block> *transtype_mapTo_Block = @[^(void){
            // transType eq to 0
        },^(void){
            // !!! classify equal 0,transType eq to 1
           [self.iconImageView setImage:[UIImage imageNamed:@"recharge"]];
            NSString *titleInfo = TPString(@"充值：来自%@",itemModel.fromAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"+%.4f",yufloat_token(itemModel.value));
            [self.statusLabel setText:TPString(@"充值%@",statusStr)];
            
        },^(void){
            // !!! classify equal 0,transType eq to 2
            [self.iconImageView setImage:[UIImage imageNamed:@"withdraw"]];
            NSString *titleInfo = TPString(@"提现：提到%@",itemModel.toAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"-%.4f",yufloat_token(itemModel.value));
            [self.statusLabel setText:TPString(@"提现%@",statusStr)];
        }];
        if ([statusStr isEqualToString:@"等待中"]) {
            [self.statusLabel setText:@"等待中..."];
        }
        transtype_mapTo_Block[itemModel.transactionType]();
    },^(void){
        // classify equal 1
    },^(void){
        // classify equal 2
    },^(void){
        // classify equal 3
    },^(void){
        // classify equal 4
    },^(void){
        // classify equal 5
        [self.statusLabel setHidden:YES];
        NSArray<void_block> *transtype_mapTo_Block = @[^(void){
            // transType eq to 0
        },^(void){
            // classify equal 5,transType eq to 1
            [self.iconImageView setImage:[UIImage imageNamed:@"receive"]];
            NSString *titleInfo = TPString(@"收款：来自%@",itemModel.fromAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"+%.4f",yufloat_token(itemModel.value));
        },^(void){
            // classify equal 5,transType eq to 2
            [self.iconImageView setImage:[UIImage imageNamed:@"transfer"]];
            NSString *titleInfo = TPString(@"转账：转到%@",itemModel.toAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"-%.4f",yufloat_token(itemModel.value));
        }];
        transtype_mapTo_Block[itemModel.transactionType]();
    }];
    classify_mapTo_Block[itemModel.classify]();
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
