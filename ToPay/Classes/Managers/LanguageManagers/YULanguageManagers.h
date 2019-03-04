//
//  YULanguageManagers.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]
#define NotiChangeLanguage @"NotiChangeLanguage"

NS_ASSUME_NONNULL_BEGIN

@interface YULanguageManagers : NSObject
+ (instancetype) shareInstance;
- (void)setCurrentLanguage_English;
- (void)setCurrentLanguage_Chinese;

@end

NS_ASSUME_NONNULL_END
