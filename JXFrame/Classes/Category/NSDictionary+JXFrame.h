//
//  NSDictionary+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JXFrame)
- (NSString *)jx_stringForKey:(NSString *)key;
- (NSString *)jx_stringForKey:(NSString *)key withDefault:(nullable NSString *)dft;

- (NSNumber *)jx_numberForKey:(NSString *)key;
- (NSNumber *)jx_numberForKey:(NSString *)key withDefault:(nullable NSNumber *)dft;

- (NSArray *)jx_arrayForKey:(NSString *)key;
- (NSArray *)jx_arrayForKey:(NSString *)key withDefault:(nullable NSArray *)dft;

- (NSDictionary *)jx_dictionaryForKey:(NSString *)key;
- (NSDictionary *)jx_dictionaryForKey:(NSString *)key withDefault:(nullable NSDictionary *)dft;

- (id)jx_objectForKey:(NSString *)key;
- (id)jx_objectForKey:(NSString *)key withDefault:(nullable id)dft;

@end

NS_ASSUME_NONNULL_END
