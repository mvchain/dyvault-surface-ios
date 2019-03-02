//
//  YUValidEmailViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUValidEmailViewController.h"
#import "YUCircleTextView.h"
#import "JKCountDownButton.h"
#import "API_GET_User_Email_Logout.h"
#import "API_POST_User.h"
#import "API_POST_User_Reset.h"
#import "YUResetPasswordViewController.h"
#import "YUForget_ResetPasswordViewModel.h"
@interface YUValidEmailViewController ();
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atlt_scrollviewTop;
@property (weak, nonatomic) IBOutlet JKCountDownButton *sendValidCodeButton;
@property (weak, nonatomic) IBOutlet YUCircleTextView *emailAddrTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *vaildCodeTextView;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@end

@implementation YUValidEmailViewController
#pragma mark - <life cycle>

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self.nextStepButton yu_fullBlueCircleStyle];
    [self.emailAddrTextView yu_emailStyle];
    [self.vaildCodeTextView yu_vaildCodeStyle];
    [self.sendValidCodeButton yu_vaildButtonStyle];
    [self.emailAddrTextView setPlaceHolder:@"邮箱地址"];
    [self.vaildCodeTextView setPlaceHolder:@"验证码"];
    [self.vaildCodeTextView.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.vaildCodeTextView).with.offset(-140);
    }];
    [self setNav];
}

- (void)setNav {
    [self addNormalNavBar:@"验证邮箱"];
    [self.normalNavbar setLeftButtonAsReturnButton];
    self.atlt_scrollviewTop.constant = self.normalNavbar.qmui_bottom;
}
#pragma mark - <private method>
- (IBAction)nextStepTap:(id)sender {
    if (self.emailAddrTextView.text.length == 0) {
        [QMUITips showError:@"邮箱不能为空"];
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
    // checkout email_code is valid
    API_POST_User_Reset *POST_User_Reset = [[API_POST_User_Reset alloc] init];
    POST_User_Reset.onSuccess = ^(id responseData) {
        NSString *token  = (NSString *)responseData;
        YUForget_ResetPasswordViewModel *forgetResetVM = [[YUForget_ResetPasswordViewModel alloc] initWithToken:token email:self.emailAddrTextView.text];
        YUResetPasswordViewController *resetPwdVC = [[YUResetPasswordViewController alloc] initWithViewModel:forgetResetVM];
        [self.navigationController pushViewController:resetPwdVC animated:YES];
    };
    POST_User_Reset.onError = ^(NSString *reason, NSInteger code) {
            [QMUITips showError:reason];
    };
    POST_User_Reset.onEndConnection = ^{
            [QMUITips hideAllTipsInView:self.view];
    };
    [POST_User_Reset sendRequestWithEmail:self.emailAddrTextView.text value:self.vaildCodeTextView.text];
}

- (IBAction)sendValidCodeTap:(id)sender {
    [QMUITips showLoadingInView:self.view hideAfterDelay:5];
    API_GET_User_Email_Logout *GET_User_Email_Logout = [[API_GET_User_Email_Logout alloc] init];
    GET_User_Email_Logout.onSuccess = ^(id responseData) {
        [self.sendValidCodeButton startCountDownWithSecond:60];
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

#pragma mark - <event response>

@end
