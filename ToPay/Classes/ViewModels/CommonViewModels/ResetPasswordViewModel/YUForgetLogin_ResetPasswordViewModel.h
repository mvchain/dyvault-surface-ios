//
//  YUForget_ResetPasswordViewModel.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YUResetPasswordViewController.h"
NS_ASSUME_NONNULL_BEGIN

// forget - reset pwd
@interface YUForgetLogin_ResetPasswordViewModel : NSObject<YUResetPasswordViewModelDelegate>
@property (weak,nonatomic) UIViewController *relatedView;
@property (copy,nonatomic) NSString *token;
@property (copy,nonatomic) NSString *email;
- (id)initWithToken:(NSString *)token email:(NSString *)email; 
@end

NS_ASSUME_NONNULL_END
