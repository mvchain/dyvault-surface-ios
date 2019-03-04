//
//  YUMineViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUMineViewController.h"
#import "YUMineItemCellEntity.h"
#import "YUMineConfirmCellEntity.h"
#import "YUAccountSecurityViewController.h"
#import "YULanguageViewController.h"
@interface YUMineViewController ()
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;
@property (weak, nonatomic) IBOutlet UILabel *userNickNamelabel;
@property (weak, nonatomic) IBOutlet UILabel *emialLabel;
@property (strong ,nonatomic) NSMutableArray <YUCellEntity *> *dataArrs ;
@end
@implementation YUMineViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setUpData];
    [self configPageListView];
    [self configPageListViewEvent];
}
#pragma mark - <private method>
- (void)setUpData {
    YUMineItemCellEntity *item0 = [[YUMineItemCellEntity alloc] init];
    item0.data = @"账户安全";
    YUMineItemCellEntity *item1 = [[YUMineItemCellEntity alloc] init];
    item1.data = @"语言";
    YUMineItemCellEntity *item2 = [[YUMineItemCellEntity alloc] init];
    item2.data = @"关于ToPay";
    YUBlankCellEntity *blank = [[YUBlankCellEntity alloc] init];
    blank.yu_cellHeight = 200;
    YUMineConfirmCellEntity *confirmEntity = [[YUMineConfirmCellEntity alloc] init];
    confirmEntity.data = @"登出";
    [self.dataArrs addObjectsFromArray:@[item0,
                                         item1,
                                         item2,
                                         blank,
                                         confirmEntity]];
}
- (void)configPageListView {
    yudef_weakSelf;
    self.pageListView.isUsingMJRefresh = NO; // not use MJRefresh
    self.pageListView.firstPageBlock = ^(block_complete  _Nonnull complete)
    {
        complete(weakSelf.dataArrs);
    };
    [self.pageListView beginRefreshHeaderWithNoAnimate];
}
#pragma mark - <event response>
- (void)configPageListViewEvent {
    yudef_weakSelf
    self.pageListView.yu_didSelectRowAtIndexPath = ^(NSIndexPath * _Nonnull indexPath)
    {
        switch (indexPath.row) {
            case 0:
            {
                YUAccountSecurityViewController *accountVc = [[YUAccountSecurityViewController alloc] init];
                [weakSelf.navigationController pushViewController:accountVc animated:YES];
                
            }
                break;
            case 1:
            {
                YULanguageViewController *languageVC = [[YULanguageViewController alloc] init];
                [weakSelf.navigationController pushViewController:languageVC animated:YES];
            }
                break;
            case 2:
                
                break;
            default:
                break;
        }
    };
    self.dataArrs.lastObject.callBackByCell = ^(NSDictionary *info)
    {
            // button tap
        
    };
    
}
#pragma mark - <lazy load>
yudef_lazyLoad(NSMutableArray <YUCellEntity *>, dataArrs, _dataArrs);

@end
