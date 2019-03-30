//
//  YUOneKeyBuyTokenOrderDetailViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/22.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol YUOneKeyBuyTokenOrderDetailViewControllerVMDelegate <NSObject>
@required
- (void)fetchListEntitys:(void(^)(NSMutableArray * entitys,BOOL isSucc,NSString *errInfo))complete;
- (NSString *)idfield;


- (void)setIdfield:(NSString *)idfield;
@optional

- (void)buttonTap:(void(^)(BOOL isSuccess))complete;
@end
@interface YUOneKeyBuyTokenOrderDetailViewController : YUBaseViewController
@property (strong,nonatomic) id<YUOneKeyBuyTokenOrderDetailViewControllerVMDelegate>viewModel;
@property (copy,nonatomic) NSString *idfield;

@end

NS_ASSUME_NONNULL_END
