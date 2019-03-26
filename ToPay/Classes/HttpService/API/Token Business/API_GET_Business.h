// https://github.com/objc94 
// created by swagger-occode api maker at 2019-03-25 13:35
// summary:token business list
#import "ServModel.h"
@interface API_GET_Business : ServModel
- (void)sendRequestWithIdField:(NSNumber *)idField pageSize:(NSNumber *)pageSize status:(NSNumber *)status;
@end
