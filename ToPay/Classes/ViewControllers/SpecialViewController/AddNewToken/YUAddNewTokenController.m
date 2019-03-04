//
//  YUAddNewTokenController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUAddNewTokenController.h"
#import "AddNewTokenItemModel.h"
#import "API_GET_Token.h"
#import "YUAddNewTokenItemCellEntity.h"
#import "YUSearchBarView.h"
#import "AssetTokenItemModel.h"
@interface YUAddNewTokenController ()
@property (weak, nonatomic) IBOutlet YUPageListView *servListView;
@property (strong,nonatomic) YUSearchBarView *searchbar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_top;
@property (assign,nonatomic) BOOL isSearchState;
@end

@implementation YUAddNewTokenController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    [self.atly_top setConstant:self.normalNavbar.qmui_bottom];
    [self configServerListView];
    [self.servListView beginRefreshHeader];
    
}
#pragma mark - <private method>
- (void)setNav {
    [self addNormalNavBar:@"添加币种"];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [self.normalNavbar setRightButtonWithImage:UIImageMake(@"search")];
    [self setNavRightButtonEvent];
    self.isSearchState = NO;
}
- (void)configServerListView {
    yudef_weakSelf;
    
    self.servListView.firstPageBlock = ^(block_complete  _Nonnull complete)
    {
        API_GET_Token *GET_Token = [[API_GET_Token alloc] init];
        GET_Token.onSuccess = ^(id responseData) {
            NSArray *resArr = (NSArray *)responseData;
            NSMutableArray *listDatas = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in resArr) {
                AddNewTokenItemModel *model = [[AddNewTokenItemModel alloc] initWithDictionary:dic];
                YUAddNewTokenItemCellEntity *entity = [[YUAddNewTokenItemCellEntity alloc] init];
                entity.isAdd = ![weakSelf isAlreadyAdded:model];
                entity.data = model;
                [listDatas addObject:entity];
            }
            complete(listDatas);
        };
        GET_Token.onError = ^(NSString *reason, NSInteger code) {
            
            [QMUITips showError:reason];
        };
        GET_Token.onEndConnection = ^{
            
        };
        [GET_Token sendRequest];
    };
}
- (BOOL)isAlreadyAdded:(AddNewTokenItemModel *)addNewTokenItem {
    for (AssetTokenItemModel *assetItem in self.alreadyAssetItems) {
       if (assetItem.tokenId == addNewTokenItem.tokenId)
           return YES;
    }
    return NO;
    
}
#pragma mark - <event ,response>
// right search button tap
- (void)setNavRightButtonEvent {

    yudef_weakSelf
    self.normalNavbar.rightButton.onClick = ^(id sender)
    {
         //[weakSelf reBackUpSearchResult] ; // 重置搜索
        UIImageView *rightImageView = (UIImageView *) weakSelf.normalNavbar.rightButton.midView;
        
         YUSearchBarView * search  = weakSelf.searchbar;
         if( !weakSelf.isSearchState ) {
             //当前非搜索状态，点击后变成搜索状态
             [rightImageView setImage:UIImageMake(@"cancel")];
             [weakSelf.normalNavbar addSubview:search];
             search.searchTextfield.text = @"";
             [search setQmui_height:36.0];
             [search setQmui_width:weakSelf.normalNavbar.qmui_width - 90];
             [search y_setCenterY:weakSelf.normalNavbar.leftButton.midView.y_centerY];
             [search y_setCenterX:weakSelf.normalNavbar.y_centerX];
             [search tobeCircle]; // 圆角
             [search.searchTextfield becomeFirstResponder];
             [search fadeIn:^{
                 
             }];
         }else{
             // 当前搜索状态，点击后变非搜索状态
             [search.searchTextfield resignFirstResponder];
             [search fadeOut:^{
                 [rightImageView setImage:UIImageMake(@"search")];
                 [weakSelf.searchbar removeFromSuperview];
             }];
         }
         weakSelf.isSearchState = !weakSelf.isSearchState; // 切换状态
         //[weakSelf.baseTableView reloadData];
     };
}


#pragma mark lazy load
- (YUSearchBarView *)searchbar {
    if( !_searchbar ) {
        _searchbar = [YUSearchBarView xib_loadUsingClassName];
        _searchbar.placeholder = @"搜索币种";
    }
    return _searchbar;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
