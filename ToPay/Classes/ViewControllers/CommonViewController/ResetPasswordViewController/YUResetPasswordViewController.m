//
//  YUResetPasswordViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUResetPasswordViewController.h"
#import "YUCircleTextView.h"
@interface YUResetPasswordViewController()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atlt_scroll_top;
@property (weak, nonatomic) IBOutlet YUCircleTextView *mnewPassWordTextView;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@end
@implementation YUResetPasswordViewController

#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - <public method>
- (id)initWithViewModel:(id<YUResetPasswordViewModelDelegate>) vm {
    self = [super init];
    if (self) {
        _viewModel = vm;
    }
    return self;
}
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    NSAssert(self.viewModel, @"### viewModel must be not null ");
    self.mnewPassWordTextView.textField.placeholder = self.viewModel.textPlaceholder;
    self.mnewPassWordTextView.textField.secureTextEntry = YES;
      self.mnewPassWordTextView.textField.keyboardType = self.viewModel.passTextFieldkeyBoardType;
    [self.confirmButton yu_gradualBlueChangeStyle];
    
}
- (void)setNav {
    [self addNormalNavBar:self.viewModel.navBarTitleName];
    [self.normalNavbar setLeftButtonAsReturnButton];
  
    self.atlt_scroll_top.constant = self.normalNavbar.qmui_bottom + 20;
}
#pragma mark - <private method>

#pragma mark - <event response>
- (IBAction)confirmTap:(id)sender {
    [QMUITips showLoadingInView:self.view];
    [self.viewModel confirmActionWithPassword:self.mnewPassWordTextView.text
                                   onSucc:^(NSDictionary * _Nonnull succDict) {
                                       
                                       [QMUITips showSucceed:@"修改成功"];
                                       [self.viewModel action_afterResetSucc:@{@"vc":self}];
                                       
    } 
                                   onFail:^(NSDictionary * _Nonnull failDict) {
                                       
                                       [QMUITips showError:failDict[@"reason"]];
    }
                          onEndConnection:^{
                                        [QMUITips hideAllTipsInView:self.view];
    }];
}



@end
