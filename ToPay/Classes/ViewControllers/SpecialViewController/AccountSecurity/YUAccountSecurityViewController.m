//
//  YUAccountSecurityViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUAccountSecurityViewController.h"
#import "YUMineItemCellEntity.h"
#import "YUResetPasswordViewController.h"
#import "YUNotificationViewController.h"
#import "TPVerifyViewController.h"
#import "TPChangePassWordViewController.h"
#import "TPChangePassWordViewModel_LoginPassWd.h"
#import "TPChangePassWordViewModel_PayPassWd.h"
@interface YUAccountSecurityViewController ()
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_pageListViewTop;
@end

@implementation YUAccountSecurityViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self.atly_pageListViewTop setConstant:self.normalNavbar.qmui_bottom];
    [self configPageListView];
    [self setEvent];
}

#pragma mark - <private method>
- (void)configPageListView {
    self.pageListView.isUsingMJRefresh = NO;
    self.pageListView.firstPageBlock = ^(block_complete  _Nonnull complete)
    {
        YUMineItemCellEntity *item0 = [[YUMineItemCellEntity alloc] init];
        item0.data = @"修改邮箱";
        YUMineItemCellEntity *item1 = [[YUMineItemCellEntity alloc] init];
        item1.data = @"修改登录密码";
        YUMineItemCellEntity *item2 = [[YUMineItemCellEntity alloc] init];
        item2.data = @"修改支付密码";
        complete(@[item0,item1,item2]);
    };
    [self.pageListView beginRefreshHeaderWithNoAnimate];
}
- (void)setNav {
    [self addNormalNavBar:@"账户安全"];
    [self.normalNavbar setLeftButtonAsReturnButton];
}
- (void)setData {
    
    
}
#pragma mark - <event response>
- (void)setEvent {
    yudef_weakSelf
    self.pageListView.yu_didSelectRowAtIndexPath = ^(NSIndexPath * _Nonnull indexPath)
    {
        switch (indexPath.row) {
            case 0:
            {
                TPVerifyViewController *notiVC = [[TPVerifyViewController alloc] init];
                [weakSelf.navigationController pushViewController:notiVC animated:YES];
            }
                break;
            case 1:
            {
                TPChangePassWordViewModel_LoginPassWd *vm = [TPChangePassWordViewModel_LoginPassWd alloc];
                TPChangePassWordViewController *changePwdVc = [[TPChangePassWordViewController alloc] initWithViewModel:vm];
                [weakSelf.navigationController pushViewController:changePwdVc animated:YES];
                break;
            }
            case 2:
            {
                TPChangePassWordViewModel_PayPassWd *vm = [TPChangePassWordViewModel_PayPassWd alloc];
                TPChangePassWordViewController *changePwdVc = [[TPChangePassWordViewController alloc] initWithViewModel:vm];
                [weakSelf.navigationController pushViewController:changePwdVc animated:YES];
                break;
            }
            default:
                break;
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
