// https://github.com/objc94 
// created by swagger-occode api maker at 2019-03-30 20:07
// summary:create order
#import "API_POST_Order.h"
@implementation API_POST_Order
- (void)sendRequestWithCny:(NSNumber *)cny uid:(NSString *)uid {
  NSString *apiPath = @"/simulation/order";
  self.apiDomainUrl = @"http://47.110.144.216/api";
  self.requestDict[@"cny"] = cny; //(null)
  self.requestDict[@"uid"] = uid; //(null)
  self.apiPath  = apiPath;
  [self connectWithRquestMethod:HTTPMethodPOST];
}
@end
