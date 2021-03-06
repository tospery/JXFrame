//
//  NSDictionary+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "NSDictionary+JXFrame.h"
#import "NSObject+JXFrame.h"
#import "NSString+JXFrame.h"

@implementation NSDictionary (JXFrame)

- (NSDictionary *)jx_dictionaryByUnderlineValuesFromCamel {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    for (NSString *key in self.allKeys) {
        NSString *value = [self objectForKey:key];
        if (![value isKindOfClass:NSString.class]) {
            [result setObject:value forKey:key];
            continue;
        }
        value = value.jx_underlineFromCamel;
        [result setObject:value forKey:key];
    }
    return result;
}

- (NSString *)jx_stringForKey:(NSString *)key {
    return [self jx_stringForKey:key withDefault:nil];
}

- (NSString *)jx_stringForKey:(NSString *)key withDefault:(NSString *)dft {
    if (!key) {
        return dft;
    }
    
    id string = [self objectForKey:key];
    if (!string || ![string isKindOfClass:[NSString class]]) {
        if ([string isKindOfClass:[NSNumber class]]) {
            NSNumber *number = (NSNumber *)string;
            if (number) {
                return number.stringValue;
            }
        }
        return dft;
    }
    
    return string;
}

- (NSNumber *)jx_numberForKey:(NSString *)key {
    return [self jx_numberForKey:key withDefault:nil];
}

- (NSNumber *)jx_numberForKey:(NSString *)key withDefault:(NSNumber *)dft {
    if (!key) {
        return dft;
    }
    
    id number = [self objectForKey:key];
    if (!number || ![number isKindOfClass:[NSNumber class]]) {
        if ([number isKindOfClass:[NSString class]]) {
            NSString *string = (NSString *)number;
            if (string) {
                return @(string.integerValue);
            }
        }
        return dft;
    }
    
    return number;
}

- (NSArray *)jx_arrayForKey:(NSString *)key {
    return [self jx_arrayForKey:key withDefault:nil];
}

- (NSArray *)jx_arrayForKey:(NSString *)key withDefault:(NSArray *)dft {
    if (!key) {
        return dft;
    }
    
    id array = [self objectForKey:key];
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return dft;
    }
    
    return array;
}

- (NSDictionary *)jx_dictionaryForKey:(NSString *)key {
    return [self jx_dictionaryForKey:key withDefault:nil];
}

- (NSDictionary *)jx_dictionaryForKey:(NSString *)key withDefault:(NSDictionary *)dft {
    if (!key) {
        return dft;
    }
    
    id dictionary = [self objectForKey:key];
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return dft;
    }
    
    return dictionary;
}

- (id)jx_objectForKey:(NSString *)key {
    return [self jx_objectForKey:key withDefault:nil];
}

- (id)jx_objectForKey:(NSString *)key withDefault:(id)dft {
    return [self jx_objectForKey:key withDefault:dft baseClass:nil];
}

- (id)jx_objectForKey:(NSString *)key withDefault:(id)dft baseClass:(Class)cls {
    if (!key) {
        return dft;
    }
    
    id object = [self objectForKey:key];
    if (!object) {
        return dft;
    }
    
    if (cls && ![object isKindOfClass:cls]) {
        return dft;
    }
    
    return object;
}

+ (NSDictionary *)jx_dictionaryFromID:(id)data {
    if (!data || ![data isKindOfClass:NSObject.class]) {
        return nil;
    }
    
    NSObject *obj = (NSObject *)data;
    return [obj jx_JSONObject];
}

@end
