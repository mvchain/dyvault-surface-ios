//
//  YUBuyTokenViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/8.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBuyTokenViewController.h"
#import "API_GET_Channel.h"
#import "YUBuyTokenCellEntity.h"
#import "BuyTokenItemModel.h"
#import "YUBuyTokenCellEntity.h"
@interface YUBuyTokenViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_top;
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;

@end

@implementation YUBuyTokenViewController

#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self configListPageView];
    [self.pageListView beginRefreshHeader];
    
    
}

#pragma mark - <private method>
- (void)setNav {
    [self addNormalNavBar:Localized(@"buy_coin")];
    [self.normalNavbar setLeftButtonAsReturnButton];
    self.atly_top.constant = self.normalNavbar.qmui_bottom +10;
}
- (void)configListPageView {
    yudef_weakSelf
    self.pageListView.pageSize = PAGE_LIST_SIZE;
    self.pageListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
    {
        API_GET_Channel *GET_Channel = [[API_GET_Channel alloc] init];
        GET_Channel.onSuccess = ^(id responseData) {
              complete([weakSelf packageListDatasByArray:(NSArray*)responseData]);
        };
        GET_Channel.onError = ^(NSString *reason, NSInteger code) {
            PAGE_COMPLETE_ERROR
        };
        GET_Channel.onEndConnection = ^{
            
        };
        [GET_Channel sendRequestWithId:0 pageSize:PAGE_LIST_SIZE];
        
    };
    self.pageListView.nextPageBlock = ^(block_page_complete  _Nonnull complete, YUPageListView * _Nonnull thisPageView)
    {
        YUBuyTokenCellEntity *lastEntity = (YUBuyTokenCellEntity*)thisPageView.lastEntity;
        BuyTokenItemModel *lastModel = (BuyTokenItemModel*)lastEntity.data;
        API_GET_Channel *GET_Channel = [[API_GET_Channel alloc] init];
        GET_Channel.onSuccess = ^(id responseData) {
            
        };
        GET_Channel.onError = ^(NSString *reason, NSInteger code) {
            
        };
        GET_Channel.onEndConnection = ^{
            
        };
        [GET_Channel sendRequestWithId:lastModel.idField pageSize:PAGE_LIST_SIZE];
    };
}

- (NSMutableArray *)packageListDatasByArray:(NSArray* )responseData {
    NSMutableArray *listDatas = [[NSMutableArray alloc] init];
    NSArray *msgArrays = responseData;
    for (NSDictionary *dic in msgArrays) {
        BuyTokenItemModel *itemModel = [[BuyTokenItemModel alloc]initWithDictionary:dic];
        YUBuyTokenCellEntity *entity = [[YUBuyTokenCellEntity alloc] init];
        entity.data=itemModel;
        [listDatas addObject:entity];
    }
    return listDatas;
}

- (void)setData {
    
}
#pragma mark - <event response>

#pragma mark - <lazy load>

@end
