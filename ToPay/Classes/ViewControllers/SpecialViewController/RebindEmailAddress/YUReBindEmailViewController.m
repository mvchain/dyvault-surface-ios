//
//  TPVerifyEmailViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/1/17.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "YUReBindEmailViewController.h"
#import "YUReBindEmailViewModel.h"
#import "YUTextView.h"
#import "JKCountDownButton.h"
#import "YUCircleTextView.h"
@interface YUReBindEmailViewController ()

@property (weak, nonatomic) IBOutlet YUCircleTextView *emailTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *vaildCodeTextView;
@property (weak, nonatomic) IBOutlet JKCountDownButton *sendVaildCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_scroll_top;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation YUReBindEmailViewController
#pragma mark lazy Load
// vm
- (YUReBindEmailViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[YUReBindEmailViewModel alloc] init];
    }
    return _viewModel;
}
#pragma mark system method
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}
#pragma mary local method
- (void)initUI {
    [self.sendVaildCodeButton yu_vaildButtonStyle];
    [self.confirmButton yu_gradualBlueChangeStyle];
    [self setNav];
    _emailTextView.textField.keyboardType = UIKeyboardTypeEmailAddress;
    _vaildCodeTextView.textField.keyboardType = UIKeyboardTypeNumberPad;
    NSArray<YUCircleTextView *> *viewArr = @[_emailTextView,_vaildCodeTextView];
    NSArray *titles = @[@"新邮箱",@"邮箱验证码"];
    NSInteger index = 0;
    for (NSString *title in titles) {
        viewArr[index].textField.placeholder = title;
        index++;
    }
    self.atly_scroll_top.constant = self.normalNavbar.qmui_height+36;
    [self.vaildCodeTextView.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.vaildCodeTextView).with.offset(-140);
    }];
}
- (void)setNav {
    [self addNormalNavBar:@"绑定新邮箱"];
    [self.normalNavbar setLeftButtonAsReturnButton];
}
- (void)startValidCodeButtonAnimate {
    [self.sendVaildCodeButton startCountDownWithSecond:60];
    self.sendVaildCodeButton.enabled = NO;
    [self.sendVaildCodeButton yu_vaildButtonStyle];
    [self.sendVaildCodeButton countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
        self.sendVaildCodeButton.enabled = YES;
        return @"发送验证码";
    }];
}
#pragma mark event method

- (IBAction)onSendVaildCodeTap:(id)sender {
    
    if (self.emailTextView.text == 0 ) {
        [QMUITips showError:@"邮箱不能为空"];
        return;
    }
    if (![QuickJudge isVaildEmail:self.emailTextView.text]) {
        [QMUITips showError:@"邮箱格式不正确"];
        return;
    }
    [self startValidCodeButtonAnimate];
    [QMUITips showLoadingInView:self.view];
    [self.viewModel sendVaildCodeByEmail:self.emailTextView.text
                                complete:^(BOOL isSucc) {
        [QMUITips hideAllTips];
                                    
        if (isSucc) {
            [QMUITips showSucceed:@"发送成功"];
        }else {
            [QMUITips showError:@"发送失败"];
        }
    }];
}

- (IBAction)onNextStep:(id)sender {
    if(self.vaildCodeTextView.text.length == 0) {
        [QMUITips showError:@"验证码不能为空"];
        return;
    }
    [QMUITips showLoadingInView:self.view hideAfterDelay:5.0];
    [self.viewModel rebindEmail:self.emailTextView.text
                          token:self.viewModel.oneceToken
                       valiCode:self.vaildCodeTextView.text
                       complete:^(BOOL isSucc, NSString *info) {
                           [QMUITips hideAllTips];
                           if (isSucc) {
                               [QMUITips showSucceed:@"绑定成功"];
                               [[YUViewControllerManagers shareInstance] clearUserInfo_AndExit];
                           }else {
                               [QMUITips showError:@"绑定失败"];
                           }
    }];
}
@end
