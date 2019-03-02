//
//  YURegisterViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/27.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YURegisterViewController.h"
#import "YUCircleTextView.h"
#import "JKCountDownButton.h"
#import "API_POST_User.h"
#import "YUSetPasswordViewController.h"
#import "API_GET_User_Email_Logout.h"
/*
 
 #pragma mark - life cycle
 #pragma mark - event response
 #pragma mark - UITableViewDelegate && UITableViewDataSource

 #pragma mark - getters and setters
 #pragma mark - private
 
 #pragma mark - <life cycle>
 #pragma mark - <public method>
 #pragma mark - <private method>
 #pragma mark - <event response>
 */
@interface YURegisterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet YUCircleTextView *userNameTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *emailAddrTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *vaildCodeTextView;
@property (weak, nonatomic) IBOutlet JKCountDownButton *sendVaildButton;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (weak, nonatomic) IBOutlet UIButton *loginNowButton;


@end

@implementation YURegisterViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [self.nextStepButton yu_fullBlueCircleStyle];
    [self.sendVaildButton yu_vaildButtonStyle];
    [self.userNameTextView setPlaceHolder:@"用户名"];
    [self.emailAddrTextView setPlaceHolder:@"邮箱地址"];
    [self.vaildCodeTextView setPlaceHolder:@"验证码"];
    [self.userNameTextView yu_userNameStyle];
    [self.emailAddrTextView yu_emailStyle];
    [self.vaildCodeTextView yu_vaildCodeStyle];
    [self.vaildCodeTextView.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.vaildCodeTextView).with.offset(-140);
    }];
}
#pragma mark - <private method>

#pragma mark - <event response>
- (IBAction)nextStepTap:(id)sender {
    yudef_weakSelf
    if (self.userNameTextView.text.length == 0) {
        [QMUITips showError:@"用户名不能为空"];
        return;
    }
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
    API_POST_User *POST_User = [[API_POST_User alloc] init];
    POST_User.onSuccess = ^(id responseData) {
        NSString *token  = (NSString *)responseData;
        RegisterRequestDataModel *requestModel =  [[RegisterRequestDataModel alloc] init];
        requestModel.token = token;
        requestModel.email = weakSelf.emailAddrTextView.text;
        requestModel.nickname = weakSelf.userNameTextView.text;
        YUSetPasswordViewController *setPasswdVc = [[YUSetPasswordViewController alloc] init];
        setPasswdVc.regRequestDataModel = requestModel;
        [weakSelf.navigationController pushViewController:setPasswdVc animated:YES];
    };
    POST_User.onError = ^(NSString *reason, NSInteger code) {
        [QMUITips showError:reason];
    };
    POST_User.onEndConnection = ^{
        [QMUITips hideAllTipsInView:self.view];
    };
    [POST_User sendRequestWithEmail:self.emailAddrTextView.text
                         inviteCode:@""
                          validCode:self.vaildCodeTextView.text];
}
- (IBAction)sendVaildCodeTap:(id)sender {
    if (self.emailAddrTextView.text.length == 0) {
        [QMUITips showError:@"邮箱地址不能为空"];
        return;
    }
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

- (void)dealloc {
    
    
}
@end
