//
//  JXFrameManager.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import "JXFrameManager.h"
#import <QMUIKit/QMUIKit.h>
#import "JXFunction.h"

@interface JXFrameManager ()

@end

@implementation JXFrameManager
- (instancetype)init {
    if (self = [super init]) {
        self.fontScale = IS_320WIDTH_SCREEN ? -2 : 0;
    }
    return self;
}

+ (instancetype)sharedInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

@end
