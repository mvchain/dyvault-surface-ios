//
//  YUTransactionDetailViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/7.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUTransactionRecordViewController.h"
#import "SGPagingView.h"
#import "TPTokenBottomView.h"
#import "AssetTokenItemModel.h"
#import "API_GET_Asset_Transaction.h"
#import "NIMScannerViewController.h"
#import "API_GET_Asset_Transaction_id.h"
#import "API_GET_Asset_tokenId.h"
#import "YUTransactionListViewController.h"
#import "YUTransferViewController.h"
#import "TPChainReceiptViewController.h"
#import "YUTransactionDetailViewController.h"
@interface YUTransactionRecordViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *cureencyBgView;
@property (weak, nonatomic) IBOutlet UIView *tokenBgView;
@property (weak, nonatomic) IBOutlet UILabel *currencyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyBalanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *tokenBalanceLabel;
@property (weak, nonatomic) IBOutlet UIView *transactionHeaderView;
@property (weak, nonatomic) IBOutlet TPTokenBottomView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_headerTop;
@property (strong, nonatomic) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;
@property (strong,nonatomic) NSArray <YUTransactionListViewController *> *subTableviews;

@end

@implementation YUTransactionRecordViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateHeaderViewInfo];
    [_subTableviews[0] refreshData];
    [_subTableviews[1] refreshData];
    [_subTableviews[2] refreshData];
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self setHeaderView];
    [self.atly_headerTop setConstant:self.normalNavbar.qmui_height +20];
    [self setSwitchTitleView];
    [self setSwitchPage];
    [self setBottomEvent];
    [self setNavEvent];
    // complete view setup
    [self setUpData];
}

#pragma mark - <private method>
- (void)setUpData {
    NSAssert(self.assetTokenModel, @"### assetTokenModel must not be null ");
    [self.currencyNameLabel setText:[YUCurrencyManager shareInstance].nowLegalCurrencyName];
}

- (void)updateHeaderViewInfo {
    API_GET_Asset_tokenId *GET_Asset_tokenId = [[API_GET_Asset_tokenId alloc] init];
    [QMUITips showLoadingInView:self.view hideAfterDelay:5.0];
    GET_Asset_tokenId.onSuccess = ^(id responseData)
    {
        AssetTokenItemModel *itemModel = [[AssetTokenItemModel alloc]initWithDictionary:(NSDictionary *)responseData];
        self.assetTokenModel.value = itemModel.value;
        CGFloat lawRatio = [[YUCurrencyManager shareInstance] nowLegalCurrencyRatio];
        CGFloat lawBalance = itemModel.value * itemModel.ratio / lawRatio;
        CGFloat tokenBalance = itemModel.value;
        [self.currencyBalanceLabel setText:TPString(@"%.2f",yufloat_lawCurrency(lawBalance))];
        [self.tokenBalanceLabel setText:TPString(@"%.4f %@",yufloat_token(tokenBalance) ,itemModel.tokenName)];
    };
    GET_Asset_tokenId.onError = ^(NSString *reason, NSInteger code)
    {
        [QMUITips showError:reason];
    };
    GET_Asset_tokenId.onEndConnection = ^{
        [QMUITips hideAllTipsInView:self.view];
    };
    [GET_Asset_tokenId sendRequestWithTokenId:self.assetTokenModel.tokenId];
    
}
- (void)setNav {
    [self addNormalNavBar:self.assetTokenModel.tokenName];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [self.normalNavbar setRightButtonWithImage:UIImageMake(@"scan-qrcode")];
}

- (void)setSwitchTitleView
{
    NSArray *titleArr = @[Localized(@"All"), Localized(@"Transfer"),Localized(@"Receive")];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorStyle =  SGIndicatorStyleDefault;
    configure.indicatorColor = [UIColor qmui_colorWithHexString:@"#FF3E4751"];
    configure.titleColor = [UIColor qmui_colorWithHexString:@"#FFB8C1D2"];
    [configure setTitleSelectedColor:[UIColor qmui_colorWithHexString:@"#FF3E4751"]];
    configure.titleFont = [UIFont systemFontOfSize:15];
    configure.showBottomSeparator = NO;
    configure.needBounces = NO;
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, self.normalNavbar.qmui_height, SCREEN_WIDTH, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    yudef_weakSelf;
    [self.pageTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH));
        make.height.equalTo(@(44));
        make.top.equalTo(weakSelf.transactionHeaderView.mas_bottom).with.offset(24);
        make.left.equalTo(@0);
    }];
}
- (void)setSwitchPage {
    yudef_weakSelf;
    void(^callBack) (TransactionRecordModel *recordItemModel) = ^(TransactionRecordModel *recordItemModel) {
        YUTransactionDetailViewController *detailVC = [[YUTransactionDetailViewController alloc]init];
        detailVC.transactionRecordModel = recordItemModel;
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    };
    YUTransactionListViewController *tableVc0 = [[YUTransactionListViewController alloc]init];
    tableVc0.transactionType  = 0;
    tableVc0.selectedCallBack = callBack;
    tableVc0.assetTokenModel = self.assetTokenModel;
    YUTransactionListViewController *tableVc1 =  [[YUTransactionListViewController alloc]init];
    tableVc1.selectedCallBack = callBack;
    tableVc1.transactionType  = 2;
    tableVc1.assetTokenModel = self.assetTokenModel;
    YUTransactionListViewController *tableVc2 =  [[YUTransactionListViewController alloc]init];
    tableVc2.selectedCallBack = callBack;
    tableVc2.transactionType  = 1;
    tableVc2.assetTokenModel = self.assetTokenModel;
    NSArray *childArr = @[tableVc0, tableVc1,tableVc2];
    _subTableviews = childArr;
    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0) parentVC:self childVCs:childArr];
    self.pageContentScrollView.delegatePageContentScrollView = self;
    [self.view addSubview:_pageContentScrollView];
    [self.pageContentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pageTitleView.mas_bottom).with.offset(10);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.bottom.equalTo(self.bottomView.mas_top);
    }];
}

- (void)setHeaderView {
    [self.tokenBgView yu_circleStyle];
    [self.cureencyBgView yu_circleStyle];
    [self.transactionHeaderView yu_smallCircleStyle];
}
- (void)pushTransferClick:(NSString *)address
{
    YUTransferViewController *transferVC = [[YUTransferViewController alloc] init];
    transferVC.assetTokenModel = self.assetTokenModel;
    transferVC.defaultAddress = address;
    [self.navigationController pushViewController:transferVC animated:YES];
}
#pragma mark - <event response>
- (void)setNavEvent {
    yudef_weakSelf
    self.normalNavbar.rightButton.onClick = ^(id sender ) {
        NIMScannerViewController * scannerVC = [[NIMScannerViewController alloc] initWithCardName:@"hahaha" avatar:nil completion:^(NSString *stringValue)
                                                {
                                                    [weakSelf pushTransferClick:stringValue];
                                                }];
        scannerVC.tokenid = @(weakSelf.assetTokenModel.tokenId).stringValue;
        [weakSelf presentViewController:scannerVC animated:YES completion:^{
            
        }];
    };
}
- (void)setBottomEvent {
    yudef_weakSelf;
    self.bottomView.chainTransferBlock = ^{
        YUTransferViewController *transferVC = [[YUTransferViewController alloc] init];
        transferVC.assetTokenModel = weakSelf.assetTokenModel;
        [weakSelf.navigationController pushViewController:transferVC animated:YES];
    };
    self.bottomView.chainReceiptBlock = ^{
        TPChainReceiptViewController *receiptVC = [[TPChainReceiptViewController alloc] init];
        receiptVC.assetModel  = weakSelf.assetTokenModel;
        [weakSelf.navigationController pushViewController:receiptVC animated:YES];
    };
}
#pragma mark - <lazy load>

#pragma mark - <delegate>
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex
{
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex
{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}
@end
