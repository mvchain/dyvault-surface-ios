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
        NSArray *status_mapTo_Str = @[@"",Localized(@"Waiting"),Localized(@"Success"),@"",@"",@"",@"",@"",@"",Localized(@"Fail")];
        NSString *statusStr = status_mapTo_Str[itemModel.status];
        [self.statusLabel setHidden:NO];
        NSArray<void_block> *transtype_mapTo_Block = @[^(void){
            // transType eq to 0
        },^(void){
            // !!! classify equal 0,transType eq to 1
           [self.iconImageView setImage:[UIImage imageNamed:@"recharge"]];
            NSString *titleInfo = TPString(@"%@%@",Localized(@"Recharge:From"),itemModel.fromAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"+%.4f",yufloat_token(itemModel.value));
            [self.statusLabel setText:TPString(@"%@%@",Localized(@"Recharge"),statusStr)];
            
        },^(void){
            // !!! classify equal 0,transType eq to 2
            [self.iconImageView setImage:[UIImage imageNamed:@"withdraw"]];
            NSString *titleInfo = TPString(@"%@%@",Localized(@"Withdraw:To"),itemModel.toAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"-%.4f",yufloat_token(itemModel.value));
            [self.statusLabel setText:TPString(@"%@%@",Localized(@"Withdraw"),statusStr)];
        }];
        if ([statusStr isEqualToString:Localized(@"Waiting")]) {
            [self.statusLabel setText:TPString(@"%@...",Localized(@"Waiting") )];
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
            NSString *titleInfo = TPString(@"%@%@",Localized(@"Receive:From"),itemModel.fromAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"+%.4f",yufloat_token(itemModel.value));
        },^(void){
            // classify equal 5,transType eq to 2
            [self.iconImageView setImage:[UIImage imageNamed:@"transfer"]];
            NSString *titleInfo = TPString(@"%@%@",Localized(@"Transfer:To"),itemModel.toAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"-%.4f",yufloat_token(itemModel.value));
        }];
        transtype_mapTo_Block[itemModel.transactionType]();
    },^(void){
        
        // classify eq 6
        [self.statusLabel setHidden:YES];
        NSArray<void_block> *transtype_mapTo_Block = @[^(void){
            // transType eq to 0
        },^(void){
            // classify equal 5,transType eq to 1
            [self.iconImageView setImage:[UIImage imageNamed:@"receive"]];
            NSString *titleInfo = TPString(@"%@%@",Localized(@"Receive:From"),itemModel.fromAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"+%.4f",yufloat_token(itemModel.value));
        },^(void){
            [self.iconImageView setImage:[UIImage imageNamed:@"pay"]];
            NSString *titleInfo = TPString(@"%@%@",@"支付给：",itemModel.toAddress);
            self.titleInfoLabel.text = titleInfo;
            self.cashNumberLabel.text = TPString(@"+%.4f",yufloat_token(itemModel.value));
        }];
        transtype_mapTo_Block[itemModel.transactionType]();
        
    }];
    classify_mapTo_Block[itemModel.classify]();
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
