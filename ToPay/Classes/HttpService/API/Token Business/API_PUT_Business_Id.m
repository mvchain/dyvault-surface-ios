// https://github.com/objc94 
// created by swagger-occode api maker at 2019-03-29 20:37
// summary:confirm order(balances must be enough)
#import "API_PUT_Business_Id.h"
@implementation API_PUT_Business_Id
- (void)sendRequestWithIdField:(NSNumber *)idField {
  NSString *apiPath = @"/business/{id}";
  apiPath = [apiPath stringByReplacingOccurrencesOfString:@"{id}" withString:idField.stringValue];
  self.apiPath  = apiPath;
  [self connectWithRquestMethod:HTTPMethodPUT];
}
@end
