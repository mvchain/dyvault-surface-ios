//
//  NSString+Pinyin.m
//  
//
//  Created by 蒲公英 on 2019/3/6.
//

#import "NSString+Pinyin.h"

@implementation NSString (Pinyin)
- (NSString *)transformToPinyin
{
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    NSString *pinyinString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    return [pinyinString stringByReplacingOccurrencesOfString:@"'" withString:@""];
}
@end
