//
//  NSDictionary+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import <UIKit/UIKit.h>

@interface NSDictionary (JXFrame)
@property (nonatomic, strong, readonly) NSDictionary *jx_underlineFromCamel;

- (NSString *)jx_stringForKey:(NSString *)key;
- (NSString *)jx_stringForKey:(NSString *)key withDefault:(NSString *)dft;

- (NSNumber *)jx_numberForKey:(NSString *)key;
- (NSNumber *)jx_numberForKey:(NSString *)key withDefault:(NSNumber *)dft;

- (NSArray *)jx_arrayForKey:(NSString *)key;
- (NSArray *)jx_arrayForKey:(NSString *)key withDefault:(NSArray *)dft;

- (NSDictionary *)jx_dictionaryForKey:(NSString *)key;
- (NSDictionary *)jx_dictionaryForKey:(NSString *)key withDefault:(NSDictionary *)dft;

- (id)jx_objectForKey:(NSString *)key;
- (id)jx_objectForKey:(NSString *)key withDefault:(id)dft;
- (id)jx_objectForKey:(NSString *)key withDefault:(id)dft baseClass:(Class)cls;

@end
