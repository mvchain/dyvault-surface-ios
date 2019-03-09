//
//  YUTransactionListViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/7.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUTransactionListViewController.h"
#import "API_GET_Asset_Transactions.h"
#import "TransactionRecordModel.h"
#import "YUTransactionRecordCellEntity.h"
#import "AssetTokenItemModel.h"
@interface YUTransactionListViewController ()
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;

@end

@implementation YUTransactionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configPageListView];
    [self.pageListView beginRefreshHeader];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
- (void)configPageListView {
    self.pageListView.pageSize = PAGE_LIST_SIZE;
    yudef_weakSelf;
    self.pageListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
    {
        API_GET_Asset_Transactions *GET_Asset_Transactions = [[API_GET_Asset_Transactions alloc] init];
        GET_Asset_Transactions.onSuccess = ^(id responseData) {
            complete([weakSelf packageByresArray:(NSArray *)responseData]);
        };
        GET_Asset_Transactions.onError = ^(NSString *reason, NSInteger code) {
            
        };
        GET_Asset_Transactions.onEndConnection = ^{
            
        };
        [GET_Asset_Transactions sendRequestWithID:0
                                         pageSize:PAGE_LIST_SIZE
                                          tokenId:self.assetTokenModel.tokenId
                                   transactionType:self.transactionType];
        
    };
    self.pageListView.nextPageBlock = ^(block_page_complete  _Nonnull complete, YUPageListView * _Nonnull thisPageView)
    {
        TransactionRecordModel *lastModel = (TransactionRecordModel *)thisPageView.lastEntity.data ;
        API_GET_Asset_Transactions *GET_Asset_Transactions = [[API_GET_Asset_Transactions alloc] init];
        GET_Asset_Transactions.onSuccess = ^(id responseData) {
            
            complete([weakSelf packageByresArray:(NSArray *)responseData]);
        };
        GET_Asset_Transactions.onError = ^(NSString *reason, NSInteger code) {
            
        };
        GET_Asset_Transactions.onEndConnection = ^{
            
        };
        [GET_Asset_Transactions sendRequestWithID:lastModel.idField
                                         pageSize:PAGE_LIST_SIZE
                                          tokenId:self.assetTokenModel.tokenId
                                  transactionType:self.transactionType];
    };
    
    self.pageListView.yu_didSelectRowAtIndexPath = ^(NSIndexPath * _Nonnull indexPath) {
        TransactionRecordModel *model = (TransactionRecordModel *)weakSelf.pageListView.dataArrays[indexPath.row].data;
        weakSelf.selectedCallBack(model);
    };

}
- (void)refreshData {
    
    [self.pageListView beginRefreshHeaderWithNoAnimate];
    
}
- (NSArray *)packageByresArray:(NSArray *)resArr {
    NSMutableArray *listDatas = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in resArr) {
        YUTransactionRecordCellEntity *entity = [[YUTransactionRecordCellEntity alloc] init];
        TransactionRecordModel *model = [[TransactionRecordModel alloc] initWithDictionary:dic];
        entity.data  = model;
        [listDatas addObject:entity];
    }
    return listDatas;
    
}


@end
