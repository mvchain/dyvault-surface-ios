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
- (void)setCurrentLanguage_English {
    [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotiChangeLanguage  object:nil];
}
- (void)setCurrentLanguage_Chinese {
    [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotiChangeLanguage  object:nil];
}

@end
