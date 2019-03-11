//
//  YUAssetViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUAssetViewController.h"
#import "YUAssetTableHeaderView.h"
#import "API_GET_Asset.h"
#import "YUAssetHeaderInfoCellEntity.h"
#import "AssetTokenItemModel.h"
#import "YUAssetTokenItemCellEntity.h"
#import "YUAddNewTokenController.h"
#import "YUNotificationViewController.h"
#import "API_GET_Asset_Balance.h"
#import "YUTransactionRecordViewController.h"
#import "YUBuyTokenViewController.h"
#import "API_GET_Message.h"
#import "MessageItemModel.h"
@interface YUAssetViewController ()
@property (weak, nonatomic) IBOutlet YUPageListView *servListView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atlt_bottom;
@property (strong,nonatomic) NSMutableArray <AssetTokenItemModel *> *assetItems;
@property (strong,nonatomic) NSArray <TPExchangeRate *>* exchangeRates;

@property (assign,nonatomic) BOOL isFirstDisplayThisVC;

@end
@implementation YUAssetViewController
#pragma mark - <life cycle>

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.isFirstDisplayThisVC = YES;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!self.isFirstDisplayThisVC) {
        [self.servListView beginRefreshHeaderWithNoAnimate];
    }
    [self updateNotificationApperance];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.isFirstDisplayThisVC = NO;
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    
    [self setNav];
    [self setNavEvent];
    [self configServListView];
    self.atly_top.constant = self.normalNavbar.qmui_bottom;
    [self setListViewEvent];
}
- (void)setNav {
    [self addNormalNavBar:@"ToPay"];
    [self.normalNavbar setRightButtonWithImage:UIImageMake(@"home_add_black") withSize:CGSizeMake(17, 17) withRight:20 withBottom:15];
    [self.normalNavbar setLeftButtonWithImage:UIImageMake(@"news_black") withSize:CGSizeMake(24, 24)];
}
#pragma mark - <private method>
- (void)configServListView {
    // firstPage
    yudef_weakSelf;
    self.servListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
    {
        API_GET_Asset *GET_Asset = [[API_GET_Asset alloc] init];
        GET_Asset.onSuccess = ^(id responseData)
        {
            NSMutableArray *listDatas = [[NSMutableArray alloc]init];
            weakSelf.assetItems = [[NSMutableArray <AssetTokenItemModel *> alloc] init];
            YUAssetHeaderInfoCellEntity *headerEntity = [[YUAssetHeaderInfoCellEntity alloc] init]; // first
            [listDatas addObject:headerEntity];
            NSArray *arrs = (NSArray *)responseData;
            for (NSDictionary *dict in arrs) {
                AssetTokenItemModel *tokenModel = [[AssetTokenItemModel alloc] initWithDictionary:dict];
                if ([[YUCurrencyManager shareInstance] isTokenVisable:tokenModel.tokenId]) {
                    // this token is visiable
                    YUAssetTokenItemCellEntity *tokenItemEn = [[YUAssetTokenItemCellEntity alloc] init];
                    tokenItemEn.data = tokenModel;
                    [weakSelf.assetItems addObject:tokenModel];
                    [listDatas addObject:tokenItemEn];
                }
            }
            API_GET_Asset_Balance *GET_Asset_Balance = [[API_GET_Asset_Balance alloc] init];
            GET_Asset_Balance.onSuccess = ^(id responseData)
            {
                NSNumber *res = (NSNumber *)responseData;
                headerEntity.balance = [res doubleValue];
                complete(listDatas);
            };
            GET_Asset_Balance.onError = ^(NSString *reason, NSInteger code) {
                complete(@[[YUErrorCellEntity quickInit:reason]]);
            };
            GET_Asset_Balance.onEndConnection = ^{
                
            };
            [GET_Asset_Balance sendRequest];
        };
        GET_Asset.onError = ^(NSString *reason, NSInteger code) {
            [QMUITips showError:reason];
            complete(@[[YUErrorCellEntity quickInit:reason]]);
        };
        GET_Asset.onEndConnection = ^{
            
        };
        [GET_Asset sendRequest];
    };
    [QMUITips showLoadingInView:self.view];
    [[YUCurrencyManager shareInstance] requestTokenListInfo:^(NSArray<AddNewTokenItemModel *> * _Nonnull models, BOOL isSucc) {
        [self.servListView beginRefreshHeader];
        [QMUITips hideAllTips];
    }];
    
}

- (void)showCurrencySelectionDialogViewController {
 
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:@"选择法币单位" message:@"" preferredStyle:QMUIAlertControllerStyleActionSheet];
    int itemIndex = 0 ;
    for (TPExchangeRate *exchangeRate in self.exchangeRates) {
        QMUIAlertAction *action = [QMUIAlertAction actionWithTitle:exchangeRate.name style:QMUIAlertActionStyleDefault handler:^(QMUIAlertController *aAlertController, QMUIAlertAction *action) {
            [[YUCurrencyManager shareInstance] setNowLegalCurrency:self.exchangeRates[itemIndex]];
            [self.servListView reloadData];
        }];
        itemIndex++;
        // QMUIAlertActionStyleDefault
        [alertController addAction:action];
    }
    QMUIAlertAction *action = [QMUIAlertAction actionWithTitle:@"取消" style:QMUIAlertActionStyleCancel handler:^(QMUIAlertController *aAlertController, QMUIAlertAction *action) {
        
    }];
    [alertController addAction:action];
    [alertController showWithAnimated:YES];
}

- (void)updateNotificationApperance {
    
    API_GET_Message *GET_Message = [[API_GET_Message alloc] init];
    GET_Message.onSuccess = ^(id responseData) {
        NSArray *dicts = (NSArray *)responseData;
        MessageItemModel *firstModel = [[MessageItemModel alloc] initWithDictionary:dicts.firstObject];
        NSInteger mostRecentTime = [[YUAppManager shareInstance] mostRecentNewsTimeInLocal];
        UIImageView *leftImageView = (UIImageView *)self.normalNavbar.leftButton.midView;;
        if (firstModel.createdAt > mostRecentTime) {
            [leftImageView setImage:UIImageMake(@"new_news")];
        }else {
            [leftImageView setImage:UIImageMake(@"news_black")];
        }
    };
    GET_Message.onError = ^(NSString *reason, NSInteger code) {
        
    };
    GET_Message.onEndConnection = ^{
        
    };
    NSString *nowTime = [QuickGet getNowTimeTimestamp];
    [GET_Message sendReuqestWithPageSize:PAGE_LIST_SIZE timestamp:nowTime.integerValue *1000];
}
#pragma mark - <event response>
- (void)setNavEvent {
    yudef_weakSelf;
    self.normalNavbar.rightButton.onClick = ^(id sender) {
        YUAddNewTokenController *add = [[YUAddNewTokenController alloc] init];
        add.alreadyAssetItems = weakSelf.assetItems;
        weakSelf.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:add animated:YES];
        weakSelf.hidesBottomBarWhenPushed = NO;
    };
    self.normalNavbar.leftButton.onClick = ^(id sender) {
        YUNotificationViewController *noti = [[YUNotificationViewController alloc] init];
        [weakSelf.navigationController pushViewController:noti animated:YES];
    };
}
- (void)setListViewEvent {
    yudef_weakSelf
    self.servListView.yu_didSelectRowAtIndexPath = ^(NSIndexPath * _Nonnull indexPath)
    {
        if (indexPath.row == 0) return;
        YUTransactionRecordViewController *transAcationDetail = [[YUTransactionRecordViewController alloc] init];
        transAcationDetail.assetTokenModel = weakSelf.assetItems[indexPath.row-1];
        [weakSelf.navigationController pushViewController:transAcationDetail animated:YES];
    };
    
    self.servListView.yu_eventProduceByInnerCellView = ^(NSString * _Nonnull idf, id  _Nonnull content, id  _Nonnull sender)
    {
        if ([idf isEqualToString:EVENT_ChangeLegalCurrency]) {
            [weakSelf showCurrencySelectionDialogViewController];
            return ;
        }
        if ([idf isEqualToString:EVENT_BuyCurrency]) {
            YUBuyTokenViewController *buyTokenVC = [[YUBuyTokenViewController alloc]init];
            [weakSelf.navigationController pushViewController:buyTokenVC animated:YES];
            
            return ;
        }
    };
}

#pragma mark lazy load
- (NSArray <TPExchangeRate *> *)exchangeRates {
    if(!_exchangeRates) {
        _exchangeRates = [YUCurrencyManager shareInstance].legalCurrencyListArrays;
    }
    return _exchangeRates;
    
}
@end
