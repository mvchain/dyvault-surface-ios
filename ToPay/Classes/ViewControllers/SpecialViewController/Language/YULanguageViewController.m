//
//  YULanguageViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YULanguageViewController.h"
#import "YULanguageItemCellEntity.h"

@interface YULanguageViewController ()
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;

@end

@implementation YULanguageViewController

#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self setEvent];
    [self configPageListView];
    self.pageListView.tableView.contentInset = UIEdgeInsetsMake(self.normalNavbar.qmui_bottom+10, 0, 0, 0);
    
}

#pragma mark - <private method>
- (void)setNav {
    [self addNormalNavBar:@"语言"];
    [self.normalNavbar setLeftButtonAsReturnButton];
}
- (void)configPageListView {
    self.pageListView.isUsingMJRefresh = NO;
    self.pageListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
    {
        BOOL isCN = [[YULanguageManagers shareInstance] isCN_Language];
        YULanguageItemCellEntity *item0 = [[YULanguageItemCellEntity alloc] init];
        item0.data = @"中文";
        item0.isSelected = isCN;
        YULanguageItemCellEntity *item1 = [[YULanguageItemCellEntity alloc] init];
        item1.data = @"English";
        item1.isSelected = !isCN;
        complete(@[item0,item1]);
    };
    [self.pageListView beginRefreshHeaderWithNoAnimate];
}
- (void)setData {
    
}
#pragma mark - <event response>
- (void)setEvent {
    yudef_weakSelf;
    self.pageListView.yu_didSelectRowAtIndexPath = ^(NSIndexPath * _Nonnull indexPath)
    {
        if (indexPath.row == 0) {
            [[YULanguageManagers shareInstance] setCurrentLanguage_Chinese];
            [QMUITips showInfo:@"当前语言: 中文" inView:weakSelf.view hideAfterDelay:1.5];
        } else {
            [[YULanguageManagers shareInstance] setCurrentLanguage_English];
            [QMUITips showInfo:@"Current Language:English" inView:weakSelf.view hideAfterDelay:1.5];
        }
        [weakSelf.pageListView beginRefreshHeaderWithNoAnimate];
        
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
