//
//  QuickGet.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuickGet : NSObject
+ (NSString *) encryptPwd:(NSString *)pwd salt:(NSString *)m_salt;
+ (NSString *) md5:(NSString *) input;
+ (NSString *) getBundleIdStr;
+ (NSString *) getCurBuildVersion;
+ (CGFloat) makeFloatNumber:(CGFloat) num tailNum:(int)tailNum;
+ (NSString *)getUUID;
@end

NS_ASSUME_NONNULL_END
