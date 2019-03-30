// https://github.com/objc94 
// created by swagger-occode api maker at 2019-03-30 20:07
// summary:callback url
#import "ServModel.h"
@interface API_POST_Order_Callback : ServModel
- (void)sendRequestWithOrderStatus:(NSNumber *)orderStatus message:(NSString *)message status:(NSNumber *)status orderNumber:(NSString *)orderNumber;
@end
