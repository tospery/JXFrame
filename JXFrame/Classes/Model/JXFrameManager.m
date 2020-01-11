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
        self.pageStart = 0;
        self.pageSize = 20;
        self.pageStyle = JXPageStyleGroup;
        self.primaryColor = UIColorYellow;
    }
    return self;
}

- (UIImage *)loadingImage {
    if (!_loadingImage) {
        _loadingImage = JXImageInBundle(@"jx_loading");
    }
    return _loadingImage;
}

- (UIImage *)waitingImage {
    if (!_waitingImage) {
        _waitingImage = JXImageInBundle(@"jx_waiting");
    }
    return _waitingImage;
}

- (UIImage *)emptyErrorImage {
    if (!_emptyErrorImage) {
        _emptyErrorImage = JXImageInBundle(@"jx_error_empty");
    }
    return _emptyErrorImage;
}

- (UIImage *)networkErrorImage {
    if (!_networkErrorImage) {
        _networkErrorImage = JXImageInBundle(@"jx_error_network");
    }
    return _networkErrorImage;
}

- (UIImage *)serverErrorImage {
    if (!_serverErrorImage) {
        _serverErrorImage = JXImageInBundle(@"jx_error_server");
    }
    return _serverErrorImage;
}

- (UIImage *)expiredErrorImage {
    if (!_expiredErrorImage) {
        _expiredErrorImage = JXImageInBundle(@"jx_error_expired");
    }
    return _expiredErrorImage;
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
