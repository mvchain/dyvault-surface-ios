//
//  YUOneKeyButTokenListChildViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyButTokenListChildViewController.h"
#import "YUOneKeyBuyTokenListCellEntity.h"
#import "API_GET_Business.h"
#import "OneKeyBuyTokenListItem.h"
#import "YUOneKeyBuyTokenListCellEntity.h"
@interface YUOneKeyButTokenListChildViewController ()
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_top;
@property (assign,nonatomic) BOOL isFirst;
@end

@implementation YUOneKeyButTokenListChildViewController

#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configPageListView];
    [self configEvent];
    [self.pageListView beginRefreshHeader];
    self.view.backgroundColor = [UIColor qmui_colorWithHexString:@"#F8F8F8"];
    self.pageListView.backgroundColor = [UIColor qmui_colorWithHexString:@"#F8F8F8"];
    self.isFirst = YES;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!self.isFirst) {
        [self refreshData];
    }
    self.isFirst = NO;
}
#pragma mark - <private method>
- (void)configPageListView {
    self.pageListView.pageSize = PAGE_LIST_SIZE;
    yudef_weakSelf;
    self.pageListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
    {
        NSMutableArray *listDatas = [[NSMutableArray alloc] init];
        API_GET_Business *GET_Business = [[API_GET_Business alloc] init];
        GET_Business.onSuccess = ^(id responseData) {
            NSArray *arr = (NSArray *)responseData;
            for (NSDictionary *dictItem in arr) {
                OneKeyBuyTokenListItem *itemModel = [[OneKeyBuyTokenListItem alloc] initWithDictionary:dictItem];
                YUOneKeyBuyTokenListCellEntity *entity = [[YUOneKeyBuyTokenListCellEntity alloc] initWithOneKeyBuyTokenListItem:itemModel];
                [listDatas addObject:entity];
            }
            complete(listDatas);
        };
        GET_Business.onError = ^(NSString *reason, NSInteger code) {
            
        };
        GET_Business.onEndConnection = ^{
            
        };
        [GET_Business sendRequestWithIdField:@0
                                    pageSize:@(PAGE_LIST_SIZE)
                                      status:@(self.status)];

    };
    self.pageListView.nextPageBlock = ^(block_page_complete  _Nonnull complete, YUPageListView * _Nonnull thisPageView)
    {
        OneKeyBuyTokenListItem *lastItem = thisPageView.lastEntity.data;
        NSMutableArray *listDatas = [[NSMutableArray alloc] init];
        API_GET_Business *GET_Business = [[API_GET_Business alloc] init];
        GET_Business.onSuccess = ^(id responseData) {
            NSArray *arr = (NSArray *)responseData;
            for (NSDictionary *dictItem in arr) {
                OneKeyBuyTokenListItem *itemModel = [[OneKeyBuyTokenListItem alloc] initWithDictionary:dictItem];
                YUOneKeyBuyTokenListCellEntity *entity = [[YUOneKeyBuyTokenListCellEntity alloc] initWithOneKeyBuyTokenListItem:itemModel];
                [listDatas addObject:entity];
            }
            complete(listDatas);
        };
        GET_Business.onError = ^(NSString *reason, NSInteger code) {
            
        };
        GET_Business.onEndConnection = ^{
            
        };
        [GET_Business sendRequestWithIdField:@(lastItem.idField)
                                    pageSize:@(PAGE_LIST_SIZE)
                                      status:@(self.status)];
    };
    
    
}
- (void)refreshData {
    [self.pageListView beginRefreshHeaderWithNoAnimate];
}

#pragma mark - <event response>
- (void)configEvent {
    yudef_weakSelf;
    self.pageListView.yu_didSelectRowAtIndexPath = ^(NSIndexPath * _Nonnull indexPath) {
        if (weakSelf.selectedCallBack) {
            weakSelf.selectedCallBack(weakSelf.pageListView.dataArrays[indexPath.row]);
        }
    };
}
#pragma mark - <lazy load>

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
