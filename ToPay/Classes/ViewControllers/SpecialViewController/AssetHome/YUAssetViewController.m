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
        self.exchangeRates = [YUCurrencyManager shareInstance].legalCurrencyListArrays;
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
    [self.normalNavbar setRightButtonWithImage:UIImageMake(@"home_add_black")];
    [self.normalNavbar setLeftButtonWithImage:UIImageMake(@"news_black") withSize:CGSizeMake(15, 20)];
}
#pragma mark - <private method>
- (void)configServListView {
    // firstPage
    yudef_weakSelf;
    self.servListView.firstPageBlock = ^(block_complete  _Nonnull complete)
    {
        API_GET_Asset *GET_Asset = [[API_GET_Asset alloc] init];
        GET_Asset.onSuccess = ^(id responseData) {
            NSMutableArray *listDatas = [[NSMutableArray alloc]init];
            weakSelf.assetItems = [[NSMutableArray <AssetTokenItemModel *> alloc] init];
            YUAssetHeaderInfoCellEntity *en = [[YUAssetHeaderInfoCellEntity alloc] init]; // first
            [listDatas addObject:en];
            NSArray *arrs = (NSArray *)responseData;
            for (NSDictionary *dict in arrs) {
                AssetTokenItemModel *tokenModel = [[AssetTokenItemModel alloc] initWithDictionary:dict];
                YUAssetTokenItemCellEntity *tokenItemEn = [[YUAssetTokenItemCellEntity alloc] init];
                tokenItemEn.data = tokenModel;
                [weakSelf.assetItems addObject:tokenModel];
                [listDatas addObject:tokenItemEn];
            }
            complete(listDatas);
        };
        GET_Asset.onError = ^(NSString *reason, NSInteger code) {
            [QMUITips showError:reason];
            complete(@[[YUErrorCellEntity quickInit:reason]]);
        };
        GET_Asset.onEndConnection = ^{
            
        };
        [GET_Asset sendRequest];
    };
    [self.servListView beginRefreshHeader];
}
- (void)showCurrencySelectionDialogViewController {
    QMUIDialogSelectionViewController *dialogViewController = [[QMUIDialogSelectionViewController alloc] init];
    dialogViewController.title = @"更改货币";
    NSMutableArray *currencysTitles = [[NSMutableArray alloc] init];
    for (TPExchangeRate *exchangeRate in self.exchangeRates) {
        [currencysTitles addObject:exchangeRate.name];
    }
    dialogViewController.items = currencysTitles;
    dialogViewController.cellForItemBlock = ^(QMUIDialogSelectionViewController *aDialogViewController, QMUITableViewCell *cell, NSUInteger itemIndex) {
        cell.accessoryType = UITableViewCellAccessoryNone;// 移除点击时默认加上右边的checkbox
    };
    dialogViewController.heightForItemBlock = ^CGFloat (QMUIDialogSelectionViewController *aDialogViewController, NSUInteger itemIndex) {
        return 54;
    };
    dialogViewController.didSelectItemBlock = ^(QMUIDialogSelectionViewController *aDialogViewController, NSUInteger itemIndex) {
        [aDialogViewController hide];
        [[YUCurrencyManager shareInstance] setNowLegalCurrency:self.exchangeRates[itemIndex]];
        [self.servListView reloadData];
    };
    [dialogViewController show];
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
    self.servListView.yu_eventProduceByInnerCellView = ^(NSString * _Nonnull idf, id  _Nonnull content, id  _Nonnull sender)
    {
        if ([idf isEqualToString:EVENT_ChangeLegalCurrency]) {
            [weakSelf showCurrencySelectionDialogViewController];
            return ;
        }
        if ([idf isEqualToString:EVENT_BuyCurrency]) {
            return ;
        }
    };
}

@end