//
//  TPChangePassWordViewController.h
//  ToPay
//
//  Created by 蒲公英 on 2019/1/17.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "YUBaseViewController.h"
#import "YUResetPasswordViewController.h"
/**
 * 改变（支付/登录）密码
 */
@class YUForgetLogin_ResetPasswordViewModel;
@class YUForgetPay_ResetPasswordViewModel;
@protocol TPChangePassWordViewModelProtocol <NSObject>
@required

- (NSString *)navBarTitle;
- (NSString *)firstTextFieldPlaceholder;
- (NSString *)nextTextFieldPlaceholder;
- (UIKeyboardType)textFieldKeyboardType;
- (void)changePassWdWithOldPassWd:(NSString *)old
                        newPassWd:(NSString *)newPassWd
                         complete:(void(^)(BOOL isSucc,NSString *info))complete;
- (void)action_afterChangePwd:(NSDictionary *)dict;
- (id<YUResetPasswordViewModelDelegate>)resetForgetPwdVM;

@end

@interface TPChangePassWordViewController : YUBaseViewController
@property (strong, nonatomic) id<TPChangePassWordViewModelProtocol> viewModel;
- (instancetype)initWithViewModel:(id<TPChangePassWordViewModelProtocol>)vm;

@end


