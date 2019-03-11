//
//  YUCircleTextView.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUCircleTextView.h"
@interface YUCircleTextView() <UITextFieldDelegate>
@end

@implementation YUCircleTextView
yudef_lazyLoad(UITextField, textField, _textField);
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
    
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    yudef_weakSelf
    [self addSubview:self.textField];
    self.backgroundColor = [UIColor qmui_colorWithHexString:@"#F1F1F1"];
    self.textField.textColor = [UIColor qmui_colorWithHexString:@"#999999"];
    self.textField.font = [UIFont systemFontOfSize:16.0];
    self.textField.delegate = self ;
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf).with.offset(20);
        make.centerY.equalTo(weakSelf);
        make.trailing.equalTo(weakSelf).with.offset(-20);
    }];
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}
- (void)textFieldDidChange:(UITextField *)textfield {
    if( _onTextChange ) {
        _onTextChange(textfield.text);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if( _onTextDidEndEditing ) {
        _onTextDidEndEditing( textField );
    }
}
- (NSString *)text {
    return self.textField.text;
}
- (void)setText:(NSString *)text {
    self.textField.text = text;
}
- (void)setPlaceHolder:(NSString *)text {
    self.textField.placeholder = text;
    
}
/* style  */
- (void)yu_emailStyle {
    self.textField.keyboardType = UIKeyboardTypeAlphabet;
    self.textField.keyboardType = UIKeyboardTypeEmailAddress;
    
}
- (void)yu_vaildCodeStyle {
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
}
- (void)yu_userNameStyle {
    self.textField.keyboardType = UIKeyboardTypeAlphabet;
}

- (void)yu_payPasswordStyle {
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.secureTextEntry = YES;
}
- (void)yu_loginPassWordStyle  {
    self.textField.keyboardType = UIKeyboardTypeAlphabet;
    self.textField.secureTextEntry = YES;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    [self yu_smallCircleStyleWithRadius:10.0];
}
@end
