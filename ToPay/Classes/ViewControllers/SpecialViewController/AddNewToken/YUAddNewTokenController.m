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
#import "API_PUT_Asset.h"
#import "NSString+Pinyin.h"
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
    [self setListViewEvent];
    [self setSearchBarTextChangeEvent];
    
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
    self.servListView.isUsingMJRefresh = NO;
    self.servListView.firstPageBlock = ^(block_page_complete  _Nonnull complete)
    {
        API_GET_Token *GET_Token = [[API_GET_Token alloc] init];
        GET_Token.onSuccess = ^(id responseData) {
            NSArray *resArr = (NSArray *)responseData;
            NSMutableArray *listDatas = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in resArr) {
                AddNewTokenItemModel *model = [[AddNewTokenItemModel alloc] initWithDictionary:dic];
                [[YULanguageManagers shareInstance] setTokenFullNameByTokenName:model.tokenName
                                                                    fullName_en:model.tokenEnName
                                                                    fullName_cn:model.tokenCnName];
                if ( model.visible != 0) {
                    YUAddNewTokenItemCellEntity *entity = [[YUAddNewTokenItemCellEntity alloc] init];
                    entity.isAdd = ![weakSelf isAlreadyAdded:model];
                    entity.isShowAddButton = YES;
                    entity.data = model;
                    [listDatas addObject:entity];
                }
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
        UIImageView *rightImageView = (UIImageView *) weakSelf.normalNavbar.rightButton.midView;
         YUSearchBarView * search  = weakSelf.searchbar;
         if( !weakSelf.isSearchState ) {
             //当前非搜索状态，点击后变成搜索状态
             [weakSelf.servListView entoSearchingStatus];
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
             [weakSelf.servListView exitSearchingStatus];
             if (!(sender == weakSelf.searchbar)) {
                 // not searchbar
                 [search.searchTextfield resignFirstResponder];
             }
             [search fadeOut:^{
                 [rightImageView setImage:UIImageMake(@"search")];
                 [weakSelf.searchbar removeFromSuperview];
             }];
         }
         weakSelf.isSearchState = !weakSelf.isSearchState; // 切换状
     };
}

- (void)setSearchBarTextChangeEvent {
    __weak typeof (self) wsf = self;
    self.searchbar.onTextChange = ^(NSString *text) {
        [wsf.servListView searchUsingKeyWord:text matchBlock:^BOOL(id  _Nonnull obj)
         {
             YUAddNewTokenItemCellEntity *entity = (YUAddNewTokenItemCellEntity *)obj;
             AddNewTokenItemModel *item = (AddNewTokenItemModel*)entity.data;
             NSString *key =  [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
             key = [key uppercaseString];
             key = [key stringByReplacingOccurrencesOfString:@" " withString:@""]; // remove space
             if( [key isEqualToString:@""] ) return YES;
             if( [item.tokenName containsString:key] ) {
                 return YES;
             }
             if( [item.tokenCnName containsString:key] ) {
                 return YES;
             }
             if( [item.tokenEnName containsString:key] ) {
                 return YES;
             }
             NSString *tkpinyin = [[item.tokenCnName transformToPinyin] uppercaseString];
             tkpinyin = [tkpinyin stringByReplacingOccurrencesOfString:@" " withString:@""];
             if( [tkpinyin  containsString:key] ) {
                 return YES;
             }
             return NO;
         }];
    };
    self.searchbar.onTextDidEndEditing = ^(id sender) {
        wsf.normalNavbar.rightButton.onClick(wsf.searchbar);// end editing , end searching ...
    };
}

- (void)setListViewEvent {
    yudef_weakSelf;
    self.servListView.yu_eventProduceByInnerCellView = ^(NSString * _Nonnull idf, id  _Nonnull content, id  _Nonnull sender)
    {
        
        YUAddNewTokenItemCellEntity *item = (YUAddNewTokenItemCellEntity *)content;
        AddNewTokenItemModel *tokenModel = (AddNewTokenItemModel*)item.data;
        API_PUT_Asset *PUT_Asset = [[API_PUT_Asset alloc] init];
        NSString *addTokenIdArr = item.isAdd ?TPString(@"%ld",(long)tokenModel.tokenId):@"";
        NSString *removeTokenIdArr = !item.isAdd?TPString(@"%ld",(long)tokenModel.tokenId):@"";
        PUT_Asset.onSuccess = ^(id responseData) {
            item.isAdd = !item.isAdd ;
            [weakSelf.servListView reloadData];
        };
        PUT_Asset.onError = ^(NSString *reason, NSInteger code) {
           
            [QMUITips showError:reason];
        };
        PUT_Asset.onEndConnection = ^{
            [QMUITips hideAllTipsInView:weakSelf.view];
        };
        if (item.isAdd) {
            // when tap add btn
            [QMUITips showLoadingInView:weakSelf.view hideAfterDelay:5.0 ];
            [PUT_Asset sendRequestWithAddTokenIdArr:addTokenIdArr
                                   removeTokenIdArr:removeTokenIdArr];
            
        }else {
            // when add delete btn
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                                     message:TPString(@"确定移除%@?",tokenModel.tokenName)
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action)
                                          
            {
                [QMUITips showLoadingInView:weakSelf.view hideAfterDelay:5.0 ];
                [PUT_Asset sendRequestWithAddTokenIdArr:addTokenIdArr
                                       removeTokenIdArr:removeTokenIdArr];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];
            [alertController addAction:cancelAction];
            [alertController addAction:resetAction];
            [self presentViewController:alertController
                               animated:YES
                             completion:nil];
        }
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

@end
