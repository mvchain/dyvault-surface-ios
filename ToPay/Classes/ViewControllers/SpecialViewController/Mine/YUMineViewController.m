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
#import "TPAboutViewController.h"
@interface YUMineViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_top;
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;
@property (weak, nonatomic) IBOutlet UILabel *userNickNamelabel;
@property (weak, nonatomic) IBOutlet UILabel *emialLabel;
@property (strong ,nonatomic) NSMutableArray <YUCellEntity *> *dataArrs ;
@end
@implementation YUMineViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    yudef_weakSelf;
    [super viewDidLoad];
    [[YUUserManagers shareInstance] updateUserInfo:^(BOOL isSucc) {
        [weakSelf.userNickNamelabel setText:[YUUserManagers shareInstance].nowUserInfo.nickname];
        [weakSelf.emialLabel setText:[YUUserManagers shareInstance].nowUserInfo.username];
    }];
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setUpData];
    [self configPageListView];
    [self configPageListViewEvent];
    CGFloat mostTop = [QuickJudge is_iPhoneX] ?62:42;
    self.atly_top.constant = mostTop;
}
#pragma mark - <private method>
- (void)setUpData {
    YUMineItemCellEntity *identify = [[YUMineItemCellEntity alloc] init];
    identify.data = @"身份认证";
    YUMineItemCellEntity *receivables = [[YUMineItemCellEntity alloc] init];
    receivables.data = @"收款方式";
    YUMineItemCellEntity *item0 = [[YUMineItemCellEntity alloc] init];
    item0.data = Localized(@"account_security");
    YUMineItemCellEntity *item1 = [[YUMineItemCellEntity alloc] init];
    item1.data = Localized(@"language");
    YUMineItemCellEntity *item2 = [[YUMineItemCellEntity alloc] init];
    item2.data = Localized(@"about_us");
    YUBlankCellEntity *blank = [[YUBlankCellEntity alloc] init];
    blank.yu_cellHeight = 120;
    YUMineConfirmCellEntity *confirmEntity = [[YUMineConfirmCellEntity alloc] init];
    confirmEntity.data = Localized(@"log_out");
    [self.dataArrs addObjectsFromArray:@[
                                         
                                         item0,
                                         item1,
                                         item2,
                                         blank,
                                         confirmEntity]];
}
- (void)configPageListView {
    yudef_weakSelf;
    self.pageListView.isUsingMJRefresh = NO; // not use MJRefresh
    self.pageListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
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
            {
                TPAboutViewController *aboutVC = [[TPAboutViewController alloc] init];
                [weakSelf.navigationController pushViewController:aboutVC animated:YES];
                
            }
                break;
            default:
                break;
        }
    };
    
    self.dataArrs.lastObject.callBackByCell = ^(NSDictionary *info)
    {
            // logout  button tapfriendly_tips
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:Localized(@"friendly_tips")
                                                                                 message:Localized(@"log_out_now_?")
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *resetAction = [UIAlertAction actionWithTitle:Localized(@"confirm") style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action)
                                      
                                      {
                                          [[YUViewControllerManagers shareInstance] clearUserInfo_AndExit];
                                          
                                      }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:Localized(@"cancel")
                                                               style:UIAlertActionStyleCancel
                                                             handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:resetAction];
        [weakSelf presentViewController:alertController
                           animated:YES
                         completion:nil];
        
    };
}

- (void)dealloc{
    
    
}
#pragma mark - <lazy load>
yudef_lazyLoad(NSMutableArray <YUCellEntity *>, dataArrs, _dataArrs);

@end
