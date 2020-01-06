//
//  JXFrameManager.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXFrameManager : NSObject
@property (nonatomic, assign) CGFloat fontScale;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
