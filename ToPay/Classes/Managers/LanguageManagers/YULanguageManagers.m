//
//  YULanguageManagers.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YULanguageManagers.h"

@implementation YULanguageManagers
static YULanguageManagers* _instance = nil;
+ (instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}
+ (void)load {
    /*
     load 方法会在加载类的时候就被调用，也就是 ios 应用启动的时候，就会加载所有的类，就会调用每个类的 + load 方法.
     
     load方法的调用时机，main函数之前，先调用类中的，再调用类别中的（类别中如果有重写）.
     */
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"appLanguage"]) {
        NSArray *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        if ([language hasPrefix:@"zh-Hans"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
        }
    }
}
- (void)setTokenFullNameByTokenName:(NSString *)tokenName
                       fullName_en :(NSString *)fullName_en
                        fullName_cn:(NSString *)fullName_cn {
    [[NSUserDefaults standardUserDefaults] setObject:fullName_en forKey:TPString(@"%@_en",tokenName)];
     [[NSUserDefaults standardUserDefaults] setObject:fullName_cn forKey:TPString(@"%@_cn",tokenName)];
}
- (NSString *)tokenFullNameByTokenName:(NSString *)tokenName {
    if ([self isCN_Language]) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:TPString(@"%@_cn",tokenName)];
    }else {
        return [[NSUserDefaults standardUserDefaults] objectForKey:TPString(@"%@_en",tokenName)];
    }
  
    
}
- (void)setCurrentLanguage_English {
    [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotiChangeLanguage  object:nil];
}
- (void)setCurrentLanguage_Chinese {
    [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotiChangeLanguage  object:nil];
}
- (BOOL)isCN_Language {
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"];
    return [language isEqualToString:@"zh-Hans"];
}
@end
