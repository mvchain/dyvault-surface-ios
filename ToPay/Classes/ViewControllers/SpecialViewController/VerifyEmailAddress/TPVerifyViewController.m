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

@interface TPVerifyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet YUTextView *vaildCodeTextView;
@property (weak, nonatomic) IBOutlet JKCountDownButton *sendVaildButton;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (strong, nonatomic) TPVerifyEmailViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

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
    [self.vaildCodeTextView setPlaceHolder:@"邮箱验证码"];
    [self.vaildCodeTextView setHintText:@"邮箱验证码"];
    self.vaildCodeTextView.xibContainer.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.emailLabel.text = TPString(@"验证当前邮箱：%@",self.viewModel.currentEmail);
    self.scrollView.contentInset = UIEdgeInsetsMake(self.normalNavbar.qmui_height, 0, 0, 0  );
}
- (void)setUpNav {
    [self addNormalNavBar:@"账户安全验证"];
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
    [self.viewModel checkoutWithVaildCode:self.vaildCodeTextView.text
                                 complete:^(BOOL isVaild, NSString *token) {
        if (isVaild){
            YUReBindEmailViewController *newBind = [[YUReBindEmailViewController alloc] init];
            newBind.viewModel.oneceToken = token;
            
            [self.navigationController pushViewController:newBind animated:YES];
        }else {
           
            [QMUITips showSucceed:@"验证失败"];
        }
    }];
}

- (IBAction)onSendVaildCodeTap:(id)sender {
   
    [self startValidCodeButtonAnimate];
    [self.viewModel sendVaildCodeWithcomplete:^(BOOL isSucc) {
        if (isSucc) {
            [QMUITips showSucceed:@"发送成功"];
        }else {
            [QMUITips showError:@"发送失败"];
        }
    }];
}
@end
