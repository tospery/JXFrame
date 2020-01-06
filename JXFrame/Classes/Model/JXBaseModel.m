//
//  JXBaseModel.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXBaseModel.h"
#import <PINCache/PINCache.h>
#import "JXFunc.h"
#import "NSString+JXFrame.h"
#import "NSNumber+JXFrame.h"

@interface JXBaseModel ()

@end

@implementation JXBaseModel
#pragma mark - Init
#pragma mark - View
#pragma mark - Property
#pragma mark - Method
#pragma mark super
#pragma mark public
- (void)save {
    [self saveWithKey:self.mid];
}

- (void)saveWithKey:(nullable NSString *)key {
    [PINCache.sharedCache setObject:self forKey:[self.class objectArchiverKey:key]];
}

#pragma mark private
#pragma mark - Delegate
#pragma mark UITableViewDataSource
#pragma mark UITableViewDelegate

#pragma mark - Class
#pragma mark super
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"mid": @"id"
    };
}

+ (NSValueTransformer *)midJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSNumber jx_numberWithObject:value];
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSString jx_stringWithObject:value];
    }];
}

#pragma mark public
+ (void)storeObject:(JXBaseModel *)object {
    [object saveWithKey:object.mid];
}

+ (void)storeObject:(JXBaseModel *)object withKey:(nullable NSString *)key {
    [object saveWithKey:key];
}

+ (void)storeArray:(NSArray *)array {
    [PINCache.sharedCache setObject:array forKey:[self arrayArchiverKey]];
}

+ (JXBaseModel *)cachedObject {
    return [self cachedObjectWithKey:nil];
}

+ (JXBaseModel *)cachedObjectWithKey:(nullable NSString *)key {
    NSString *archiverKey = [self objectArchiverKey:key];
    JXBaseModel *object = [PINCache.sharedCache objectForKey:archiverKey];
    if (!object) {
        NSString *path = [NSBundle.mainBundle pathForResource:archiverKey ofType:@"json"];
        if (path.length != 0) {
            NSData *data = [NSData dataWithContentsOfFile:path options:0 error:nil];
            if (data) {
                id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                if (json && [json isKindOfClass:NSDictionary.class]) {
                    object = [MTLJSONAdapter modelOfClass:self fromJSONDictionary:json error:nil];
                }
            }
        }
    }
    return object;
}

+ (NSArray *)cachedArray {
    NSString *archiverKey = [self arrayArchiverKey];
    NSArray *array = [PINCache.sharedCache objectForKey:archiverKey];
    if (!array) {
        NSString *path = [NSBundle.mainBundle pathForResource:archiverKey ofType:@"json"];
        if (path.length != 0) {
            NSData *data = [NSData dataWithContentsOfFile:path options:0 error:nil];
            if (data) {
                id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                if (json && [json isKindOfClass:NSArray.class]) {
                    array = [MTLJSONAdapter modelsOfClass:self fromJSONArray:json error:nil];
                }
            }
        }
    }
    return array;
}

#pragma mark private
+ (NSString *)objectArchiverKey:(nullable NSString *)key {
    NSString *name = NSStringFromClass(self.class);
    if (key.length == 0) {
        return JXStrWithFmt(@"%@#object", name);
    }
    
    return JXStrWithFmt(@"%@#object#%@", name, key);
}

+ (NSString *)arrayArchiverKey {
    return JXStrWithFmt(@"%@#array", NSStringFromClass(self.class));
}


@end
