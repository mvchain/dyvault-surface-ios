//
//  YUNotificationViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUNotificationViewController.h"
#import "YUNotificationItemCellEntity.h"
#import "API_GET_Message.h"
#import "MessageItemModel.h"
@interface YUNotificationViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_pageList_top;
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;
@end
@implementation YUNotificationViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
  
  
     self.atly_pageList_top.constant = self.normalNavbar.qmui_bottom + 10;
    [self configPageListView];
    [self.pageListView beginRefreshHeader];
     
}

#pragma mark - <private method>
- (void)setNav {
    [self addNormalNavBar:@"通知"];
    [self.normalNavbar setLeftButtonAsReturnButton];
}

- (void)configPageListView {
    yudef_weakSelf
    self.pageListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
    {
        API_GET_Message *GET_Message = [[API_GET_Message alloc] init];
        GET_Message.onSuccess = ^(id responseData) {
            NSArray<YUNotificationItemCellEntity *> *listarr = [weakSelf packageListDatasByArray:(NSArray*)responseData];
            MessageItemModel *firstModel = (MessageItemModel*)listarr.firstObject.data;
            [[YUAppManager shareInstance] setMostRecentNewsInLocalWithTime:firstModel.createdAt];
            complete(listarr);
        };
        GET_Message.onError = ^(NSString *reason, NSInteger code) {
            PAGE_COMPLETE_ERROR
        };
        GET_Message.onEndConnection = ^{
            
        };
        NSString *nowTime = [QuickGet getNowTimeTimestamp];
        [GET_Message sendReuqestWithPageSize:PAGE_LIST_SIZE timestamp:nowTime.integerValue *1000];
    };
    self.pageListView.pageSize = PAGE_LIST_SIZE;
    self.pageListView.nextPageBlock = ^(block_page_complete  _Nonnull complete, YUPageListView * _Nonnull thisPageView)
    {
        YUNotificationItemCellEntity *lastEntity = (YUNotificationItemCellEntity*)thisPageView.lastEntity;
        MessageItemModel *lastModel = (MessageItemModel*)lastEntity.data;
        API_GET_Message *GET_Message = [[API_GET_Message alloc] init];
        GET_Message.onSuccess = ^(id responseData) {
            complete([weakSelf packageListDatasByArray:(NSArray *)responseData]);
        };
        GET_Message.onError = ^(NSString *reason, NSInteger code) {
            [QMUITips  showError:reason];
        };
        GET_Message.onEndConnection = ^{
            
        };
        [GET_Message sendReuqestWithPageSize:PAGE_LIST_SIZE timestamp:lastModel.createdAt];
        
        
    };
}
- (NSMutableArray<YUNotificationItemCellEntity *> *)packageListDatasByArray:(NSArray* )responseData {
    NSMutableArray *listDatas = [[NSMutableArray alloc] init];
    NSArray *msgArrays = responseData;
    for (NSDictionary *dic in msgArrays) {
        MessageItemModel *itemModel = [[MessageItemModel alloc]initWithDictionary:dic];
        YUNotificationItemCellEntity *entity = [[YUNotificationItemCellEntity alloc] init];
        entity.data=itemModel;
        [listDatas addObject:entity];
    }
    return listDatas;
}
- (void)setData {
    
}
#pragma mark - <event response>

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
