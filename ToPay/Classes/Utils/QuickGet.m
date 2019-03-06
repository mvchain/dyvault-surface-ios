//
//  QuickGet.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "QuickGet.h"
#import <CommonCrypto/CommonDigest.h>
@implementation QuickGet
+ (NSString *) encryptPwd:(NSString *)pwd salt:(NSString *)m_salt {

    NSString *salt = m_salt;
    NSString *inMd5 = [self md5:pwd];
    NSString *finalMd5 = [[self md5:TPString(@"%@%@",salt,[inMd5 uppercaseString])] uppercaseString];
    return finalMd5;
}

+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

+ (NSString *)getBundleIdStr {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

+ (NSString *)getCurBuildVersion {
    //  CFBundleVersion
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_Version;
}

+ (CGFloat)makeFloatNumber:(CGFloat) num tailNum:(int)tailNum {
    int sum = 10 ;
    while (--tailNum) {
        sum*=10;
    }
    int res_int =  (int)(num * sum);
    return res_int / (CGFloat)sum;
}

+ (NSString *)getUUID {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    return [result stringByReplacingOccurrencesOfString:@"-" withString:@""];
}
@end
