//
//  JXBaseModel.h
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXBaseModel : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy, nullable) NSString *mid;

- (void)save;
- (void)saveWithKey:(nullable NSString *)key;

+ (void)storeObject:(JXBaseModel *)object;
+ (void)storeObject:(JXBaseModel *)object withKey:(nullable NSString *)key;
+ (void)storeArray:(NSArray *)array;

+ (JXBaseModel *)cachedObject;
+ (JXBaseModel *)cachedObjectWithKey:(nullable NSString *)key;
+ (NSArray *)cachedArray;

@end

NS_ASSUME_NONNULL_END
