//
//  YULanguageManagers.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]


NS_ASSUME_NONNULL_BEGIN

@interface YULanguageManagers : NSObject
+ (instancetype) shareInstance;
- (void)setCurrentLanguage_English;
- (void)setCurrentLanguage_Chinese;
- (BOOL)isCN_Language;
- (void)setTokenFullNameByTokenName:(NSString *)tokenName
                       fullName_en :(NSString *)fullName_en
                        fullName_cn:(NSString *)fullName_cn;
- (NSString *)tokenFullNameByTokenName:(NSString *)tokenName;

@end

NS_ASSUME_NONNULL_END
