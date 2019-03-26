// https://github.com/objc94 
// created by swagger-occode api maker at 2019-03-25 13:35
// summary:token business list
#import "API_GET_Business.h"
@implementation API_GET_Business
- (void)sendRequestWithIdField:(NSNumber *)idField pageSize:(NSNumber *)pageSize status:(NSNumber *)status {
  NSString *apiPath = @"/business";
  
  self.requestDict[@"id"] = idField; //last id
  self.requestDict[@"pageSize"] = pageSize; //分页大小,默认10条
  self.requestDict[@"status"] = status; //business order status, 1 started 2 complete 4 cancel 0 all
  self.apiPath  = apiPath;
  [self connectWithRquestMethod:HTTPMethodGET];
}
@end
