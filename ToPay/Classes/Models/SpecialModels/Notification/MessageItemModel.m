//
//    MessageItemModel.m
//
//    Create by 蒲公英 on 7/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MessageItemModel.h"

NSString *const kMessageItemModelCreatedAt = @"createdAt";
NSString *const kMessageItemModelIdField = @"id";
NSString *const kMessageItemModelMessage = @"message";
NSString *const kMessageItemModelMessageId = @"messageId";
NSString *const kMessageItemModelMessageType = @"messageType";
NSString *const kMessageItemModelRead = @"read";
NSString *const kMessageItemModelStatus = @"status";
NSString *const kMessageItemModelUpdatedAt = @"updatedAt";

@interface MessageItemModel ()
@end
@implementation MessageItemModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kMessageItemModelCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = [dictionary[kMessageItemModelCreatedAt] integerValue];
    }
    
    if(![dictionary[kMessageItemModelIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kMessageItemModelIdField] integerValue];
    }
    
    if(![dictionary[kMessageItemModelMessage] isKindOfClass:[NSNull class]]){
        self.message = dictionary[kMessageItemModelMessage];
    }
    if(![dictionary[kMessageItemModelMessageId] isKindOfClass:[NSNull class]]){
        self.messageId = [dictionary[kMessageItemModelMessageId] integerValue];
    }
    
    if(![dictionary[kMessageItemModelMessageType] isKindOfClass:[NSNull class]]){
        self.messageType = dictionary[kMessageItemModelMessageType];
    }
    if(![dictionary[kMessageItemModelRead] isKindOfClass:[NSNull class]]){
        self.read = [dictionary[kMessageItemModelRead] integerValue];
    }
    
    if(![dictionary[kMessageItemModelStatus] isKindOfClass:[NSNull class]]){
        self.status = [dictionary[kMessageItemModelStatus] integerValue];
    }
    
    if(![dictionary[kMessageItemModelUpdatedAt] isKindOfClass:[NSNull class]]){
        self.updatedAt = [dictionary[kMessageItemModelUpdatedAt] integerValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kMessageItemModelCreatedAt] = @(self.createdAt);
    dictionary[kMessageItemModelIdField] = @(self.idField);
    if(self.message != nil){
        dictionary[kMessageItemModelMessage] = self.message;
    }
    dictionary[kMessageItemModelMessageId] = @(self.messageId);
    if(self.messageType != nil){
        dictionary[kMessageItemModelMessageType] = self.messageType;
    }
    dictionary[kMessageItemModelRead] = @(self.read);
    dictionary[kMessageItemModelStatus] = @(self.status);
    dictionary[kMessageItemModelUpdatedAt] = @(self.updatedAt);
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.createdAt) forKey:kMessageItemModelCreatedAt];    [aCoder encodeObject:@(self.idField) forKey:kMessageItemModelIdField];    if(self.message != nil){
        [aCoder encodeObject:self.message forKey:kMessageItemModelMessage];
    }
    [aCoder encodeObject:@(self.messageId) forKey:kMessageItemModelMessageId];    if(self.messageType != nil){
        [aCoder encodeObject:self.messageType forKey:kMessageItemModelMessageType];
    }
    [aCoder encodeObject:@(self.read) forKey:kMessageItemModelRead];    [aCoder encodeObject:@(self.status) forKey:kMessageItemModelStatus];    [aCoder encodeObject:@(self.updatedAt) forKey:kMessageItemModelUpdatedAt];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.createdAt = [[aDecoder decodeObjectForKey:kMessageItemModelCreatedAt] integerValue];
    self.idField = [[aDecoder decodeObjectForKey:kMessageItemModelIdField] integerValue];
    self.message = [aDecoder decodeObjectForKey:kMessageItemModelMessage];
    self.messageId = [[aDecoder decodeObjectForKey:kMessageItemModelMessageId] integerValue];
    self.messageType = [aDecoder decodeObjectForKey:kMessageItemModelMessageType];
    self.read = [[aDecoder decodeObjectForKey:kMessageItemModelRead] integerValue];
    self.status = [[aDecoder decodeObjectForKey:kMessageItemModelStatus] integerValue];
    self.updatedAt = [[aDecoder decodeObjectForKey:kMessageItemModelUpdatedAt] integerValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    MessageItemModel *copy = [MessageItemModel new];
    
    copy.createdAt = self.createdAt;
    copy.idField = self.idField;
    copy.message = [self.message copy];
    copy.messageId = self.messageId;
    copy.messageType = [self.messageType copy];
    copy.read = self.read;
    copy.status = self.status;
    copy.updatedAt = self.updatedAt;
    
    return copy;
}
@end
