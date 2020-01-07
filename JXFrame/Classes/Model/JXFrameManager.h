//
//  JXFrameManager.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import <UIKit/UIKit.h>

@interface JXFrameManager : NSObject
@property (nonatomic, assign) CGFloat fontScale;

+ (instancetype)sharedInstance;

@end

