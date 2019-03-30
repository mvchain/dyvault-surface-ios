// https://github.com/objc94 
// created by swagger-occode api maker at 2019-03-29 20:37
// summary:token business detail
#import "API_GET_Business_Id.h"
@implementation API_GET_Business_Id
- (void)sendRequestWithIdField:(NSNumber *)idField {
  NSString *apiPath = @"/business/{id}";
  apiPath = [apiPath stringByReplacingOccurrencesOfString:@"{id}" withString:idField.stringValue];
  self.apiPath  = apiPath;
  [self connectWithRquestMethod:HTTPMethodGET];
}
@end
