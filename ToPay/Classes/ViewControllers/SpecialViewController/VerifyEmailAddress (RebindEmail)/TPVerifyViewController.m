//
//  TPVerifyViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/1/17.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "TPVerifyViewController.h"
#import "TPVerifyEmailViewModel.h"
#import "YUTextView.h"
#import "JKCountDownButton.h"
#import "YUReBindEmailViewModel.h"
#import "YUReBindEmailViewController.h"
#import "YUCircleTextView.h"
@interface TPVerifyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet YUCircleTextView *vaildCodeTextView;
@property (weak, nonatomic) IBOutlet JKCountDownButton *sendVaildButton;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (strong, nonatomic) TPVerifyEmailViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_scrollrt_top;
@property (weak, nonatomic) IBOutlet UILabel *originEmailTips;


@end
@implementation TPVerifyViewController

#pragma mark lazy load
- (TPVerifyEmailViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[TPVerifyEmailViewModel alloc]init];
    }
    return _viewModel;
}

#pragma mark system method
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    [self.nextStepButton yu_gradualBlueChangeStyle];
    [self.sendVaildButton yu_vaildButtonStyle];
    [self.nextStepButton setTitle:Localized(@"next") forState:UIControlStateNormal];
    
    [self.vaildCodeTextView setPlaceHolder:Localized(@"Verification Code")];
    self.vaildCodeTextView.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.emailLabel.text = self.viewModel.currentEmail;
    self.atly_scrollrt_top.constant = self.normalNavbar.qmui_height;
    [self.vaildCodeTextView.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.vaildCodeTextView).with.offset(-140);
    }];
    self.originEmailTips.text = Localized(@"Please verify the original mailbox first.");
    [self.sendVaildButton setTitle:Localized(@"Get Code") forState:UIControlStateNormal];
}
- (void)setUpNav {
    [self addNormalNavBar:Localized(@"modify_email")];
    [self.normalNavbar setLeftButtonAsReturnButton];
}
#pragma mark local method
- (void)startValidCodeButtonAnimate {
    [self.sendVaildButton startCountDownWithSecond:60];
    self.sendVaildButton.enabled = NO;
    [self.sendVaildButton yu_vaildButtonStyle];
    [self.sendVaildButton countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
        self.sendVaildButton.enabled = YES;
//     /   [self.sendVaildButton rectBlackBorderStyle];
        return @"发送验证码";
    }];
}
#pragma mark event method

- (IBAction)onNextStepTap:(id)sender {
    if (self.vaildCodeTextView.text.length ==0 ){
        [QMUITips showError:@"验证码不能为空"];
        return;
    }
    [QMUITips showLoadingInView:self.view];
    [self.viewModel checkoutWithVaildCode:self.vaildCodeTextView.text
                                 complete:^(BOOL isVaild, NSString *token) {
        [QMUITips hideAllTips];
        if (isVaild){
            YUReBindEmailViewController *newBind = [[YUReBindEmailViewController alloc] init];
            newBind.viewModel.oneceToken = token;
            [self.navigationController pushViewController:newBind animated:YES];
        }else {
            [QMUITips showError:@"验证失败"];
        }
    }];
}

- (IBAction)onSendVaildCodeTap:(id)sender {
   
    [self startValidCodeButtonAnimate];
    [QMUITips showLoadingInView:self.view];
    
    [self.viewModel sendVaildCodeWithcomplete:^(BOOL isSucc) {
        [QMUITips hideAllTips];
        if (isSucc) {
            [QMUITips showSucceed:@"发送成功"];
        }else {
            [QMUITips showError:@"发送失败"];
        }
    }];
}
@end
