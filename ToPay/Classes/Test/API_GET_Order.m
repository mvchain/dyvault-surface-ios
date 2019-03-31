// https://github.com/objc94 
// created by swagger-occode api maker at 2019-03-30 20:07
// summary:get order list
#import "API_GET_Order.h"
@implementation API_GET_Order
- (void)sendRequestWithUid:(NSString *)uid {
  NSString *apiPath = @"/simulation/order";
  self.apiDomainUrl = @"http://47.110.144.216/api";
  self.requestDict[@"uid"] = uid; //uid
  self.apiPath  = apiPath;
  [self connectWithRquestMethod:HTTPMethodGET];
}
@end
