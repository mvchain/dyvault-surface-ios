//
//  YULoginViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YULoginViewController.h"
#import "YUCircleTextView.h"
#import "YURegisterViewController.h"
#import "API_POST_User_Login.h"
#import "JKCountDownButton.h"
#import "API_GET_User_Valid.h"
#import "API_GET_User_Email_Logout.h"
#import "YUValidEmailViewController.h"
#import "YUForgetLogin_ResetPasswordViewModel.h"
@interface YULoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetPassWdButton;
@property (weak, nonatomic) IBOutlet JKCountDownButton *sendVaildButton;
@property (weak, nonatomic) IBOutlet YUCircleTextView *emailAddrTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *passWordTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *vaildCodeTextView;
@end

@implementation YULoginViewController
#pragma mark - <life cycle>

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)initSubviews {
    [super initSubviews];
    [self.loginButton yu_gradualBlueChangeStyle];
    [self.vaildCodeTextView yu_vaildCodeStyle];
    [self.emailAddrTextView setPlaceHolder:@"邮箱地址"];
    [self.passWordTextView setPlaceHolder:@"登录密码"];
    [self.vaildCodeTextView setPlaceHolder:@"验证码"];
    [self.emailAddrTextView yu_emailStyle];
    [self.passWordTextView yu_loginPassWordStyle];
    [self.vaildCodeTextView yu_vaildCodeStyle];
    [self.sendVaildButton yu_vaildButtonStyle];
    [self.vaildCodeTextView.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.vaildCodeTextView).with.offset(-140);
    }];
    
}

#pragma mark - <public method>

#pragma mark - <private method>

#pragma mark - <event response>

- (IBAction)loginButtonTap:(id)sender {
    if (self.emailAddrTextView.text.length == 0) {
        [QMUITips showError:@"邮箱不能为空"];
        return;
    }
    if (self.passWordTextView.text.length == 0) {
        [QMUITips showError:@"密码不能为空"];
        return;
    }
    if (self.vaildCodeTextView.text.length == 0) {
        [QMUITips showError:@"验证码不能为空"];
        return;
    }
    if (![QuickJudge isVaildEmail:self.emailAddrTextView.text]) {
        [QMUITips showError:@"邮箱格式不正确"];
        return;
    }
    [QMUITips showLoadingInView:self.view hideAfterDelay:5];
    API_POST_User_Login *POST_User_Login = [[API_POST_User_Login alloc] init];
    POST_User_Login.onSuccess = ^(id responseData) {
        NSDictionary *data = (NSDictionary *)responseData;
        UserIDCardModel *userIDCard = [[UserIDCardModel alloc]initWithDictionary:data];
        [[YUUserManagers shareInstance] change_userIDCard_inDisk:userIDCard];
        UIViewController *tab =  [[YUViewControllerManagers shareInstance] getNewMainTabViewController]; // switch to main tab ..
        [[YUCurrencyManager shareInstance] updateExchangeRate:^(BOOL isSucc) {
                //fetch exchange
            [self.navigationController pushViewController:tab animated:YES];
            
        }];
            };
    POST_User_Login.onError = ^(NSString *reason, NSInteger code) {
        [QMUITips showError:reason];
    };
    
    POST_User_Login.onEndConnection = ^{
        [QMUITips hideAllTipsInView:self.view];
    };
    [POST_User_Login sendRequestWithImageToken:@""
                                      password:self.passWordTextView.text
                                      username:self.emailAddrTextView.text
                                     validCode:self.vaildCodeTextView.text];
}
- (IBAction)forgetButtonTap:(id)sender {
    YUValidEmailViewController *validVC = [[YUValidEmailViewController alloc] init];
    validVC.resetForgetPwdVM = [[YUForgetLogin_ResetPasswordViewModel alloc]init];
    [self.navigationController pushViewController:validVC animated:YES];
}
- (IBAction)sendVaildCodeButtonTap:(id)sender {
    
    [QMUITips showLoadingInView:self.view hideAfterDelay:5];
    API_GET_User_Email_Logout *GET_User_Email_Logout = [[API_GET_User_Email_Logout alloc] init];
    GET_User_Email_Logout.onSuccess = ^(id responseData) {
        [self.sendVaildButton startCountDownWithSecond:60];
       
        [QMUITips showSucceed:@"发送成功"];
    };
    GET_User_Email_Logout.onError = ^(NSString *reason, NSInteger code) {
       
        [QMUITips showError:reason];
    };
    GET_User_Email_Logout.onEndConnection = ^{
         [QMUITips hideAllTipsInView:self.view];
    };
    [GET_User_Email_Logout sendRequestWithEmail:self.emailAddrTextView.text];
}
- (IBAction)regitserButtonTap:(id)sender {
    [QuickDo pushViewControllerFromParentVc:self childClass:YURegisterViewController.class];
}
@end
