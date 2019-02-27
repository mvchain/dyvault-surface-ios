//
//  YUPhoneInformationTools.m
//  Forum
//
//  Created by yxyyxy on 29/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUPhoneInformationTools.h"
#import <objc/runtime.h>
#import "sys/utsname.h"
#import <UserNotifications/UserNotifications.h>
static const CGFloat buttonWidth = 80;

@implementation YUPhoneInformationTools
+ (BOOL)isIphoneX {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"]) {
        // judgment by height when in simulators
        return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
                CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)));
    }
    BOOL isIPhoneX = [platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,6"];
    return isIPhoneX;
}

+ (CGFloat)navBarBottom {
    return [self isIphoneX] ? 88 : 64;
}

+ (CGFloat)tabBarHeight {
    return [self isIphoneX] ? 83 : 49.0;
}

+ (CGFloat)screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}
+ (CGFloat)screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}
+ (CGRect )llnavButtonFrame{
    return CGRectMake(0, 0, buttonWidth, [YUPhoneInformationTools navBarBottom ]);
}

+ (CGRect)rrnavButtonFrame{
    
     return CGRectMake([YUPhoneInformationTools screenWidth] -buttonWidth, 0, buttonWidth, [YUPhoneInformationTools navBarBottom]);
    
}
+ (CGSize)getSpaceLabelHeight:(NSString*)str
                    withFont:(UIFont*)font
                   withWidth:(CGFloat)width
                   lineSpace:(CGFloat) lineSpace
                  max_height:(CGFloat)maxheight {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    if( lineSpace > 0 ) {
        paraStyle.lineSpacing = lineSpace;
    }
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0
                          };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, maxheight) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size;
    
    
}
+ (void)isMessageNotificationServiceOpen:(void(^)(BOOL isopen ))isopen {
    
    
    if (@available(iOS 10 , *)) {
        [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            if (settings.authorizationStatus == UNAuthorizationStatusDenied) { // 没权限
                isopen(NO);
                
            }else {
                isopen(YES);
            }
            
        }];
    } else if (@available(iOS 8 , *)) {
        UIUserNotificationSettings * setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (setting.types == UIUserNotificationTypeNone) { // 没权限
            isopen(NO);
            
        }else{
            isopen(YES);
        }
        
    } else {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if (type == UIUserNotificationTypeNone) {
            isopen(NO);
        }else {
            isopen(YES);
        }
        
    }
}
+ (BOOL)isFirstUseApp {
   NSString * sign =  [[NSUserDefaults standardUserDefaults]objectForKey:@"shkhkfigigfpejfejfefjeljll"];
    if( [sign isEqualToString:@"NOT_FIRST"] ) return NO;
    [[NSUserDefaults standardUserDefaults] setObject:@"NOT_FIRST" forKey:@"shkhkfigigfpejfejfefjeljll"];
    return YES;
    
}
@end
