//
//  JXBaseModel.h
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>
#import "JXIdentifiable.h"

@interface JXBaseModel : MTLModel <MTLJSONSerializing, JXIdentifiable>
@property (nonatomic, copy, readonly) NSString *mid;

- (void)save;
- (void)saveWithKey:(NSString *)key;

+ (void)storeObject:(JXBaseModel *)object;
+ (void)storeObject:(JXBaseModel *)object withKey:(NSString *)key;
+ (void)storeArray:(NSArray *)array;

+ (JXBaseModel *)cachedObject;
+ (JXBaseModel *)cachedObjectWithKey:(NSString *)key;
+ (NSArray *)cachedArray;

@end

