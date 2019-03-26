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
@property (weak, nonatomic) IBOutlet UILabel *registerLabel;
@property (weak, nonatomic) IBOutlet YUCircleTextView *userNameTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *emailAddrTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *vaildCodeTextView;
@property (weak, nonatomic) IBOutlet JKCountDownButton *sendVaildButton;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (weak, nonatomic) IBOutlet UIButton *loginNowButton;
@property (weak, nonatomic) IBOutlet UILabel *alreadyAccount;
@property (weak, nonatomic) IBOutlet UILabel *loginNowLabel;


@end

@implementation YURegisterViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - <public method>
- (void)initSubviews {
    [self addNormalNavBar:@""];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [super initSubviews];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [self.nextStepButton yu_gradualBlueChangeStyle];
    [self.sendVaildButton yu_vaildButtonStyle];
    [self.userNameTextView setPlaceHolder:Localized(@"Nickname")];
    [self.emailAddrTextView setPlaceHolder:Localized(@"Email address")];
    [self.vaildCodeTextView setPlaceHolder:Localized(@"Verification Code")];
    [self.nextStepButton setTitle:Localized(@"next") forState:UIControlStateNormal];
    [self.sendVaildButton setTitle:Localized(@"Get Code") forState:UIControlStateNormal];
    [self.userNameTextView yu_userNameStyle];
    [self.emailAddrTextView yu_emailStyle];
    [self.vaildCodeTextView yu_vaildCodeStyle];
    [self.alreadyAccount setText:Localized(@"There are already accounts?")];
    [self.loginNowLabel setText:Localized(@"Sign in now")];
    [self.registerLabel setText:Localized(@"Sign up")];
    
    [self.vaildCodeTextView.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.vaildCodeTextView).with.offset(-140);
    }];
}
#pragma mark - <private method>

#pragma mark - <event response>
- (IBAction)nextStepTap:(id)sender {
    yudef_weakSelf
    if (self.userNameTextView.text.length == 0) {
        [QMUITips showError:Localized(@"Nickname can not be empty")];
        return;
    }
    if (self.emailAddrTextView.text.length == 0) {
        [QMUITips showError:Localized(@"Email can not be empty")];
        return;
    }
    if (self.vaildCodeTextView.text.length == 0) {
        [QMUITips showError:Localized(@"Verification code must be filled")];
        return;
    }
    if (![QuickJudge isVaildEmail:self.emailAddrTextView.text]) {
        [QMUITips showError:Localized(@"Email format is incorrect")];
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
        [QMUITips showError:Localized(@"Email address cannot be empty")];
        return;
    }
    [QMUITips showLoadingInView:self.view hideAfterDelay:5];
    API_GET_User_Email_Logout *GET_User_Email_Logout = [[API_GET_User_Email_Logout alloc] init];
    GET_User_Email_Logout.onSuccess = ^(id responseData) {
        [self.sendVaildButton startCountDownWithSecond:60];
        [QMUITips showSucceed:Localized(@"Sent successfully")];
    };
    GET_User_Email_Logout.onError = ^(NSString *reason, NSInteger code) {
        
        [QMUITips showError:reason];
    };
    GET_User_Email_Logout.onEndConnection = ^{
        [QMUITips hideAllTipsInView:self.view];
    };
    [GET_User_Email_Logout sendRequestWithEmail:self.emailAddrTextView.text];
}
- (IBAction)alreadyHaveAccountTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)dealloc {
    
    
}
@end
