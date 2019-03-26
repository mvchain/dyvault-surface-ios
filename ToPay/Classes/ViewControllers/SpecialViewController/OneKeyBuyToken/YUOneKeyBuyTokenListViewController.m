//
//  YUOneKeyBuyTokenListViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyBuyTokenListViewController.h"
#import "SGPagingView.h"
#import "YUOneKeyButTokenListChildViewController.h"
#import "YUOneKeyBuyTokenOrderDetailViewController.h"
#import "YUOneKeyBuyTokenListCellEntity.h"
#import "YUOneKeyBuyTokenOrderDetailCancelVM.h"
#import "YUOneKeyBuyTokenOrderDetailAlreadyReceiptlVM.h"
#import "YUOneKeyBuyTokenOrderDetailWaitingVM.h"
@interface YUOneKeyBuyTokenListViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>
@property (strong, nonatomic) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;
@property (strong,nonatomic) NSArray <YUOneKeyButTokenListChildViewController *> *subTableVCs;
@end

@implementation YUOneKeyBuyTokenListViewController

#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self setSwitchTitleView];
    [self setSwitchPage];
}

#pragma mark - <private method>
- (void)setNav {
    [self addNormalNavBar:Localized(@"buy_coin")];
    [self.normalNavbar setLeftButtonAsReturnButton];
}

- (void)setSwitchTitleView
{
    NSArray *titleArr = @[@"全部", @"进行中",@"已完成",@"已取消"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorStyle =  SGIndicatorStyleDefault;
    configure.indicatorColor = [UIColor qmui_colorWithHexString:@"#FF3E4751"];
    configure.titleColor = [UIColor qmui_colorWithHexString:@"#FFB8C1D2"];
    [configure setTitleSelectedColor:[UIColor qmui_colorWithHexString:@"#FF3E4751"]];
    configure.titleFont = [UIFont systemFontOfSize:15];
    configure.showBottomSeparator = NO;
    configure.needBounces = NO;
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, self.normalNavbar.qmui_height, SCREEN_WIDTH, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    yudef_weakSelf;
    [self.pageTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH));
        make.height.equalTo(@(44));
        make.top.equalTo(weakSelf.normalNavbar.mas_bottom).with.offset(2);
        make.left.equalTo(@0);
    }];
}
- (void)setSwitchPage {
    YUOneKeyButTokenListChildViewController *tableVc0 = [[YUOneKeyButTokenListChildViewController alloc]init];
    tableVc0.status = 0;
    YUOneKeyButTokenListChildViewController *tableVc1 = [[YUOneKeyButTokenListChildViewController alloc]init];
    tableVc1.status = 1;
    YUOneKeyButTokenListChildViewController *tableVc2 = [[YUOneKeyButTokenListChildViewController alloc]init];
    tableVc2.status = 2;
    YUOneKeyButTokenListChildViewController *tableVc3 = [[YUOneKeyButTokenListChildViewController alloc]init];
    tableVc3.status = 4;
    NSArray *childArr = @[tableVc0, tableVc1,tableVc2,tableVc3];
    _subTableVCs= childArr;
    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0) parentVC:self childVCs:childArr];
    self.pageContentScrollView.delegatePageContentScrollView = self;
    [self.view addSubview:_pageContentScrollView];
    [self.pageContentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pageTitleView.mas_bottom).with.offset(10);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
    [self setVCCallBack];
}

#pragma mark - <event response>
- (void)setVCCallBack {
    yudef_weakSelf
    [_subTableVCs bk_each:^(id obj) {
        YUOneKeyButTokenListChildViewController *realObj = obj;
        realObj.selectedCallBack = ^(id  _Nonnull itemModel) {
            YUOneKeyBuyTokenListCellEntity *itemEntity = (YUOneKeyBuyTokenListCellEntity*)itemModel;
            YUOneKeyBuyTokenOrderDetailViewController *detail = [[YUOneKeyBuyTokenOrderDetailViewController alloc] init];
            id<YUOneKeyBuyTokenOrderDetailViewControllerVMDelegate> viewModel;
            switch (itemEntity.status) {
                case OneKeyBuyTokenStatusAlreadyCancle:
                {
                    viewModel = [[YUOneKeyBuyTokenOrderDetailCancelVM alloc] init];
                }
                    break;
                case OneKeyBuyTokenStatusAlreadyComplete:
                {
                    viewModel = [[YUOneKeyBuyTokenOrderDetailAlreadyReceiptlVM alloc] init];
                }
                    break;
                case OneKeyBuyTokenStatusAlreadyReceivables:
                {
                    viewModel = [[YUOneKeyBuyTokenOrderDetailAlreadyReceiptlVM alloc] init];
                }
                    break;
                case OneKeyBuyTokenStatusWaitingReceivables:
                {
                    viewModel = [[YUOneKeyBuyTokenOrderDetailWaitingVM alloc] init];
                }
                    break;
                default:
                    break;
            }
            detail.viewModel = viewModel;
            [weakSelf.navigationController pushViewController:detail animated:YES];
            
            NSLog(@"select");
        };
    }];
}
#pragma mark - <lazy load>

#pragma mark pageDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex
{
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex
{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}


@end
