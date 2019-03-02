//
//  YUResetPasswordViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

/*
 
 who ?
 
 YUForget_ResetPasswordViewModel
 
 */
@protocol YUResetPasswordViewModelDelegate <NSObject>
- (NSInteger)passWdType; // 1 login_pwd | 2 pay_pwd
- (NSString *)token;
- (NSString *)navBarTitleName;
- (NSString *)textPlaceholder;
- (void)confirmActionWithPassword:(NSString *)password
                       onSucc:(void(^)(NSDictionary *succDict ))onSucc
                       onFail:(void(^)(NSDictionary *failDict ))onFail
              onEndConnection:(void(^)(void))onEndConnection;




@end

@interface YUResetPasswordViewController : YUBaseViewController
@property (copy,nonatomic) NSString *titleName;
@property (copy,nonatomic) NSString *placeholder;
@property (strong,nonatomic) id<YUResetPasswordViewModelDelegate> viewModel ;
- (id)initWithViewModel:(id<YUResetPasswordViewModelDelegate>) vm;

@end

NS_ASSUME_NONNULL_END
