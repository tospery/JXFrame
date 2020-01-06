//
//  UIApplication+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (JXFrame)
@property (nonatomic, copy, readonly) NSString *jx_version;
@property (nonatomic, copy, readonly) NSString *jx_urlScheme;
@property (nonatomic, copy, readonly) NSString *jx_displayName;
@property (nonatomic, copy, readonly) NSString *jx_teamID;

@end

NS_ASSUME_NONNULL_END
