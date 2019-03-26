//
//  TPChangePassWordViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/1/17.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "TPChangePassWordViewController.h"
#import "TPChangePassWordViewModel_PayPassWd.h"
#import "TPChangePassWordViewModel_LoginPassWd.h"
#import "YUTextView.h"
#import "YUCircleTextView.h"
#import "YUValidEmailViewController.h"

@interface TPChangePassWordViewController ()
@property (weak, nonatomic) IBOutlet UIButton *forgetButton;
@property (weak, nonatomic) IBOutlet YUCircleTextView *passWordTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *mnewPassWordTextView;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation TPChangePassWordViewController
#pragma mark init
- (instancetype)initWithViewModel:(id<TPChangePassWordViewModelProtocol>)vm {
    self = [super init];
    if (self) {
        self.viewModel = vm;
    }
    return self;
}
#pragma mark system method 
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    NSAssert(self.viewModel !=nil, @"ViewModel 必须存在！");
    self.scrollView.contentInset = UIEdgeInsetsMake(self.normalNavbar.qmui_height, 0, 0, 0);
    [_label setText:Localized(@"Forgot your original password?")];
    self.passWordTextView.textField.placeholder = self.viewModel.firstTextFieldPlaceholder;
    self.passWordTextView.textField.keyboardType = self.viewModel.textFieldKeyboardType;
    self.mnewPassWordTextView.textField.placeholder = self.viewModel.nextTextFieldPlaceholder;
    self.mnewPassWordTextView.textField.keyboardType = self.viewModel.textFieldKeyboardType;
    self.passWordTextView.textField.secureTextEntry = YES;
    self.mnewPassWordTextView.textField.secureTextEntry = YES;
    [self.nextStepButton yu_gradualBlueChangeStyle];
    [self.nextStepButton setTitle:Localized(@"Confirm the changes") forState:UIControlStateNormal];
}
- (void)setNav {
    [self addNormalNavBar:self.viewModel.navBarTitle];
    [self.normalNavbar setLeftButtonAsReturnButton];
}
#pragma mark event method
- (IBAction)onForgetPassWdTap:(id)sender {
  
    YUValidEmailViewController *validVC = [[YUValidEmailViewController alloc] init];
    validVC.resetForgetPwdVM = self.viewModel.resetForgetPwdVM;
    [self.navigationController pushViewController:validVC animated:YES];
}
- (IBAction)onConfirmChangeTap:(id)sender {
    
    if (self.passWordTextView.text.length == 0) {
        [QMUITips showError:Localized(@"Old password cannot be empty")];
        return;
    }
    if (self.mnewPassWordTextView.text.length == 0) {
        [QMUITips showError:Localized(@"New password cannot be empty")];
        return;
    }
    [QMUITips showLoadingInView:self.view];
    [self.viewModel changePassWdWithOldPassWd:self.passWordTextView.text
                                    newPassWd:self.mnewPassWordTextView.text
                                     complete:^(BOOL isSucc, NSString *info) {
                                         [QMUITips hideAllTips];
                                         if (isSucc) {
                                             [QMUITips showSucceed:Localized(@"Successfully modified")];
                                             [self.viewModel action_afterChangePwd:@{@"vc":self}];
                                         }else {
                                             
                                             NSString *failStr = Localized(@"change Password failure");
                                             [QMUITips showError:TPString(@"%@:%@",failStr,info)];
                                         }
                                         
    }];
}
@end
