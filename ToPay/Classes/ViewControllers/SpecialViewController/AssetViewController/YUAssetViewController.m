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
@interface YUAssetViewController ()
@property (weak, nonatomic) IBOutlet YUPageListView *servListView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atlt_bottom;
@property (strong,nonatomic) NSMutableArray <AssetTokenItemModel *> *assetItems;
@end
@implementation YUAssetViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self setNavEvent];
    [self configServListView];
    self.atly_top.constant = self.normalNavbar.qmui_bottom;
}
- (void)setNav {
    [self addNormalNavBar:@"ToPay"];
    [self.normalNavbar setRightButtonWithImage:UIImageMake(@"home_add_black")];
    
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
}


@end
