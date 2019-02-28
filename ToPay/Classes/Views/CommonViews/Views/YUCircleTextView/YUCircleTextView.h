//
//  YUCircleTextView.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YUCircleTextView : UIView
@property (strong,nonatomic) UITextField *textField;
- (NSString *)text;
- (void)setText:(NSString *)text;
- (void)setPlaceHolder:(NSString *)text;
- (void)yu_emailStyle;
- (void)yu_vaildCodeStyle;
- (void)yu_userNameStyle;
- (void)yu_loginPassWordStyle ;
- (void)yu_payPasswordStyle;
@end

NS_ASSUME_NONNULL_END
