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
        //self.primaryColor = UIColorYellow;
    }
    return self;
}

- (JXPage *)page {
    if (!_page) {
        _page = [[JXPage alloc] init];
    }
    return _page;
}

- (UIImage *)loadingImage {
    if (!_loadingImage) {
        _loadingImage = JXImageBundle(@"jx_loading");
    }
    return _loadingImage;
}

- (UIImage *)waitingImage {
    if (!_waitingImage) {
        _waitingImage = JXImageBundle(@"jx_waiting");
    }
    return _waitingImage;
}

+ (instancetype)share {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

@end
