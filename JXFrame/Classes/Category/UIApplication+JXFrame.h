//
//  UIApplication+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/4.
//

#import <UIKit/UIKit.h>

@interface UIApplication (JXFrame)
@property (nonatomic, strong, readonly) NSString *jx_version;
@property (nonatomic, strong, readonly) NSString *jx_urlScheme;
@property (nonatomic, strong, readonly) NSString *jx_displayName;
@property (nonatomic, strong, readonly) NSString *jx_teamID;
@property (nonatomic, strong, readonly) NSString *jx_bundleID;

@end

