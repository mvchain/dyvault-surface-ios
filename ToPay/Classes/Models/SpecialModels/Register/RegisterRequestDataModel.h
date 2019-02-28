//
//  RegisterRequestDataModel.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterRequestDataModel : NSObject
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *inviteCode;
@property (copy, nonatomic) NSString *nickname;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *transactionPassword;
@property (copy, nonatomic) NSString *token;
@end

NS_ASSUME_NONNULL_END
