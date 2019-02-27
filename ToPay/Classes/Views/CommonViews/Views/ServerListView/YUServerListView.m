//
//  YUServerListView.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/27.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUServerListView.h"
#import <MJRefresh.h>

@interface YUServerListView() <UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray<YUCellEntity *> * dataArrays ;
@property (strong,nonatomic) ServModel *servModel;


@end

@implementation YUServerListView
#pragma mark lazy_load
yudef_lazyLoad(NSMutableArray<YUCellEntity *>, dataArrays, _dataArrays);
yudef_lazyLoad(UITableView, tableView, _tableView);
yudef_lazyLoad(ServModel, servModel, _servModel);
#pragma mark life cycle

- (void)layoutSubviews
{
    self.tableView.frame = self.bounds;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

#pragma mark private method
- (void)setUp
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self setRefresh];
}
- (void)setRefresh
{
    yudef_weakSelf;
    [self.tableView addHeaderWithBlock:^(MJRefreshHeader *header) {
       
    }];
    [self.tableView addFooterWithBlock:^(MJRefreshFooter *footer) {
        
    }];
}

- (void)firstPage
{
    self.dataArrays = [[NSMutableArray<YUCellEntity *> alloc ] init];
    [self.tableView reloadData];
    
}

- (void)nextPage
{
    [self.servModel conn:^(NSDictionary *resData) {
        
    }      requestMethod:self.httpRequstType
                     err:^(NSString *reason, NSInteger code) {
    }];
}

// last item id
- (NSInteger)lastId {
    if (self.dataArrays && self.dataArrays.count == 0)
        return 0;
    YUCellEntity *lastEntity = self.dataArrays.lastObject;
    NSObject *obj = lastEntity.data ;
    NSAssert(self.parameterIDKey, @"parameterIDKey must be not null");
    NSInteger lastId = (NSInteger)[obj valueForKey:self.parameterIDKey];
    return lastId;
}
#pragma mark public method
- (void)setHttpPath:(NSString *)httpPath {
    _httpPath = httpPath;
    self.servModel.apiPath = httpPath;
}
#pragma mark - <tableView delegate >
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellByIndexPath:indexPath dataArrays:self.dataArrays];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArrays[indexPath.row].yu_cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.yu_didSelectRowAtIndexPath(indexPath);
}
@end
