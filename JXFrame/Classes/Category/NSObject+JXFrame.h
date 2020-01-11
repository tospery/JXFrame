//
//  NSObject+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import <UIKit/UIKit.h>

@interface NSObject (JXFrame)
@property (nonatomic, copy, readonly) NSString *jx_className;

@property (class, nonatomic, copy, readonly) NSString *jx_className;


/**
 *  转换为JSON Data
 */
- (NSData *)jx_JSONData;
/**
 *  转换为字典或者数组
 */
- (id)jx_JSONObject;
/**
 *  转换为JSON 字符串
 */
- (NSString *)jx_JSONString;

@end

