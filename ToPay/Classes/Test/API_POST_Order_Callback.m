// https://github.com/objc94 
// created by swagger-occode api maker at 2019-03-30 20:07
// summary:callback url
#import "API_POST_Order_Callback.h"
@implementation API_POST_Order_Callback
- (void)sendRequestWithOrderStatus:(NSNumber *)orderStatus message:(NSString *)message status:(NSNumber *)status orderNumber:(NSString *)orderNumber {
  NSString *apiPath = @"/order/callback";
  self.requestDict[@"orderStatus"] = orderStatus; //(null)
  self.requestDict[@"message"] = message; //(null)
  self.requestDict[@"status"] = status; //(null)
  self.requestDict[@"orderNumber"] = orderNumber; //(null)
  self.apiPath  = apiPath;
  [self connectWithRquestMethod:HTTPMethodPOST];
}
@end
