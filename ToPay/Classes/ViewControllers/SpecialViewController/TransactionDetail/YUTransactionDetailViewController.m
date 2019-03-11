//
//  YUTransactionDetailViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/8.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUTransactionDetailViewController.h"
#import "YUPageListView.h"
#import "API_GET_Asset_Transaction_id.h"
#import "YUTransactionDetailItemCellEntity.h"
#import "TransactionDetailModel.h"
@interface YUTransactionDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atlt_icon_top;
@property (strong, nonatomic)  TransactionDetailModel *transactionDetailModel;
@end

@implementation YUTransactionDetailViewController

#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self configPageListView];
    [self setData];
}

#pragma mark - <private method>
- (void)setNav {
    yudef_weakSelf
    [self addNormalNavBar:@"订单详情"];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [self.normalNavbar setRightButtonWithImage:UIImageMake(@"share")];
    self.atlt_icon_top.constant = self.normalNavbar.qmui_bottom + 20;
    self.normalNavbar.rightButton.onClick = ^(id sender ) {
        UIImage *shot = [QuickGet makeImageWithView:weakSelf.view withSize:weakSelf.view.bounds.size];
        UIImage *imageToShare = shot;
        NSArray *items = @[imageToShare];
        [QuickDo shareToSystem:items target:weakSelf  success:^(bool isok) {
            
        }];
    };
    
}
- (void)setData {
    [QMUITips showLoadingInView:self.view];
    
    API_GET_Asset_Transaction_id *GET_Asset_Transaction_id = [[API_GET_Asset_Transaction_id alloc] init];
    GET_Asset_Transaction_id.onSuccess = ^(id responseData) {
        TransactionDetailModel *detaiModel = [[TransactionDetailModel alloc] initWithDictionary:(NSDictionary *)responseData];
        self.transactionDetailModel = detaiModel;
        [self updateUI];
    };
    GET_Asset_Transaction_id.onError = ^(NSString *reason, NSInteger code) {
        [QMUITips showError:reason];
    };
    GET_Asset_Transaction_id.onEndConnection = ^{
        [QMUITips hideAllTipsInView:self.view];
    };
    [GET_Asset_Transaction_id sendRequestWithID:self.transactionRecordModel.idField];
}
- (void)configPageListView {
    yudef_weakSelf;
    self.pageListView.isUsingMJRefresh = NO;
    
    self.pageListView.firstPageBlock = ^(block_page_complete  _Nonnull complete) {
        TransactionDetailModel *model =  weakSelf.transactionDetailModel ;
        YUTransactionDetailItemCellEntity *entity0 =[[YUTransactionDetailItemCellEntity alloc] init];
        entity0.leftTitleStr = @"金额";
        entity0.rightTitleStr = TPString(@"%.4f %@",yufloat_token(model.value),model.tokenName);
        entity0.rightFont = [UIFont systemFontOfSize:16];
        entity0.rightTextColor = [UIColor qmui_colorWithHexString:@"#666666"];
        
        NSArray<void_block> *classify_mapTo_Block = @[^(void){
            // classify 0
           
            YUTransactionDetailItemCellEntity *entity1 =[[YUTransactionDetailItemCellEntity alloc] init];
            entity1.leftTitleStr = @"交易手续费";
            entity1.rightTitleStr = TPString(@"%.4f %@",yufloat_fee(model.fee),model.feeTokenType );
            entity1.rightFont = [UIFont systemFontOfSize:13.0];
            entity1.rightTextColor = [UIColor qmui_colorWithHexString:@"#B9B9B9"];
            
            YUTransactionDetailItemCellEntity *entity2 =[[YUTransactionDetailItemCellEntity alloc] init];
            
            entity2.rightFont = [UIFont systemFontOfSize:13.0];
            entity2.rightTextColor = [UIColor qmui_colorWithHexString:@"#B9B9B9"];
            
            if (model.transactionType == 1) {
                // in
                entity2.leftTitleStr = @"来源地址";
                entity2.rightTitleStr = model.fromAddress;
            }else {
                // out
                entity2.leftTitleStr = @"目的地址";
                entity2.rightTitleStr = model.toAddress;
            }
    
            YUTransactionDetailItemCellEntity *entity3 =[[YUTransactionDetailItemCellEntity alloc] init];
            entity3.leftTitleStr = @"交易哈希";
            entity3.rightTitleStr = model.blockHash;
            entity3.rightFont = [UIFont systemFontOfSize:13.0];
            entity3.rightTextColor = [UIColor qmui_colorWithHexString:@"#7F95CF"];
            complete(@[entity0,entity1,entity2,entity3]);
            
        },^(void){
            // classify 1
        },^(void){
            // classify 2
        },^(void){
           // classify3
        },^(void){
           // classify4
        },^(void){
            // classify5
            YUTransactionDetailItemCellEntity *entity1 =[[YUTransactionDetailItemCellEntity alloc] init];
            entity1.leftTitleStr = @"订单号";
            entity1.rightTitleStr = model.orderNumber;
            entity1.rightFont = [UIFont systemFontOfSize:13.0];
            entity1.rightTextColor = [UIColor qmui_colorWithHexString:@"#B9B9B9"];
            complete(@[entity0,entity1]);
        }];
        classify_mapTo_Block[self.transactionRecordModel.classify]();
    };
}

- (void)updateUI {
    TransactionDetailModel *itemModel = self.transactionDetailModel;
    self.timeLabel.text = [QuickGet timeWithTimeInterval_allNumberStyleString:itemModel.createdAt];
    NSArray<void_block> *classify_mapTo_Block = @[^(void){
        // classify equal 0,block transaction
        
        NSArray *status_mapTo_Str = @[@"等待中",@"等待中",@"成功",@"",@"",@"",@"",@"",@"",@"失败"];
        NSArray *status_mapTo_Image = @[@"waiting",@"waiting",@"success",@"",@"",@"",@"",@"",@"",@"failure"];
        NSString *statusStr = status_mapTo_Str[itemModel.status];
        NSString *statusImage = status_mapTo_Image[itemModel.status];
        [self.iconImageView setImage:[UIImage imageNamed:statusImage]];
        NSArray<void_block> *transtype_mapTo_Block = @[^(void){
            // transType eq to 0
        },^(void){
            // !!! classify equal 0,transType eq to 1
            [self.statusLabel setText:TPString(@"充值%@",statusStr)];
        },^(void){
            // !!! classify equal 0,transType eq to 2
            [self.statusLabel setText:TPString(@"提现%@",statusStr)];
        }];
        transtype_mapTo_Block[itemModel.transactionType]();
        if ([statusStr isEqualToString:@"等待中"]) {
            [self.statusLabel setText:@"等待中..."];
        }
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
        
        [self.iconImageView setImage:[UIImage imageNamed:@"success"]];
       
        NSArray<void_block> *transtype_mapTo_Block = @[^(void){
            // transType eq to 0
        },^(void){
            // classify equal 5,transType eq to 1

            NSString *titleInfo = TPString(@"收款：来自%@",itemModel.fromAddress);
            self.statusLabel.text = titleInfo;
        },^(void){
            // classify equal 5,transType eq to 2
         
            NSString *titleInfo = TPString(@"转账：转到%@",itemModel.toAddress);
            self.statusLabel.text = titleInfo;
        }];
        transtype_mapTo_Block[itemModel.transactionType]();
    }];
    classify_mapTo_Block[itemModel.classify]();
    [self.pageListView beginRefreshHeaderWithNoAnimate];
    

}
#pragma mark - <event response>

#pragma mark - <lazy load>

@end
