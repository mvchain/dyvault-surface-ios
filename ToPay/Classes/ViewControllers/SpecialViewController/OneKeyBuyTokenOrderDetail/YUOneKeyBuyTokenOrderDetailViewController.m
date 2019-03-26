//
//  YUOneKeyBuyTokenOrderDetailViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOneKeyBuyTokenOrderDetailViewController.h"
#import "YUOneKeyBuyTokenOrderDetailCancelVM.h"
#import "YUOneKeyBuyTokenOrderDetailAlreadyReceiptlVM.h"
#import "YUOneKeyBuyTokenOrderDetailWaitingVM.h"
@interface YUOneKeyBuyTokenOrderDetailViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_top;
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;
@end

@implementation YUOneKeyBuyTokenOrderDetailViewController

#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
   
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self configPageListView];
    self.atly_top.constant = self.normalNavbar.qmui_bottom + 10;
    self.pageListView.backgroundColor = [UIColor qmui_colorWithHexString:@"#F8F8F8"];
    [self.pageListView beginRefreshHeader];
    
}

#pragma mark - <private method>
- (void)setNav {
    [self addNormalNavBar:@"订单详情"];
    [self.normalNavbar setLeftButtonAsReturnButton];
}
- (void)configPageListView {
    self.pageListView.pageSize = PAGE_LIST_SIZE;
    yudef_weakSelf;
    NSAssert(self.viewModel, @"@#### viewModel !! not null !!");
    self.pageListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
    {
        [weakSelf.viewModel fetchListEntitys:^(NSMutableArray * _Nonnull entitys, BOOL isSucc, NSString * _Nonnull errInfo)
        {
            if (isSucc) {
                complete(entitys);
            }else {
                complete(@[[YUErrorCellEntity quickInit:errInfo]]);
            }
        }];
        
    };
    
}

#pragma mark - <event response>

#pragma mark - <lazy load>


@end
