//
//  UIDevice+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/6.
//

#import <UIKit/UIKit.h>

@interface UIDevice (JXFrame)
@property (nonatomic, assign, readonly) BOOL jx_isJailBreaked;
@property (nonatomic, assign, readonly) CGFloat jx_ppi;
@property (nonatomic, copy, readonly) NSString *jx_uuid;
@property (nonatomic, copy, readonly) NSString *jx_idfa;
@property (nonatomic, copy, readonly) NSString *jx_idfv;
@property (nonatomic, copy, readonly) NSString *jx_model;

@end

