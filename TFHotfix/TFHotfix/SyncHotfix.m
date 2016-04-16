//
//  SyncHotfix.m
//  TFHotfix
//
//  Created by Melvin on 3/18/16.
//  Copyright © 2016 TimeFace. All rights reserved.
//

#import "SyncHotfix.h"

@implementation SyncHotfix {
    NSString *_appKey;
    NSString *_version;
}

- (instancetype)initWithAppKey:(NSString *)appKey {
    self = [super init];
    if (self) {
        _appKey = appKey;
        _version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    }
    return self;
}

- (TFRequestMethod)requestMethod {
    return TFRequestMethodGet;
}


- (TFRequestSerializerType)requestSerializerType {
    return TFRequestSerializerTypeJSON;
}

- (NSString *)requestUrl {
    return @"http://stg2.v5time.net/hotfix/hotfix/sync";
}

- (id)requestArgument {
    return @{@"appkey": _appKey,
             @"version": _version,
             @"platform":@"1"};
}

@end
