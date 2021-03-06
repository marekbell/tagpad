//
//  DBAccountInfo.m
//  DropboxSDK
//
//  Created by Brian Smith on 5/3/10.
//  Copyright 2010 Dropbox, Inc. All rights reserved.
//

#import "DBAccountInfo.h"


@implementation DBAccountInfo

- (id)initWithDictionary:(NSDictionary*)dict {
    if ((self = [super init])) {
        country = [[dict objectForKey:@"country"] retain];
        displayName = [[dict objectForKey:@"display_name"] retain];
        quota = [[DBQuota alloc] initWithDictionary:[dict objectForKey:@"quota_info"]];
        userId = [[[dict objectForKey:@"uid"] stringValue] retain];
    }
    return self;
}

- (void)dealloc {
    [country release];
    [displayName release];
    [quota release];
    [userId release];
    [super dealloc];
}

@synthesize country;
@synthesize displayName;
@synthesize quota;
@synthesize userId;


#pragma mark NSCoding methods

- (void)encodeWithCoder:(NSCoder*)coder {
    [coder encodeObject:country forKey:@"country"];
    [coder encodeObject:displayName forKey:@"displayName"];
    [coder encodeObject:quota forKey:@"quota"];
    [coder encodeObject:userId forKey:@"userId"];
}

- (id)initWithCoder:(NSCoder*)coder {
    self = [super init];
    country = [[coder decodeObjectForKey:@"country"] retain];
    displayName = [[coder decodeObjectForKey:@"displayName"] retain];
    quota = [[coder decodeObjectForKey:@"quota"] retain];
    userId = [[coder decodeObjectForKey:@"userId"] retain];
    return self;
}

@end
