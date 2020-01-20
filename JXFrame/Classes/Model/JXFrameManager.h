//
//  JXFrameManager.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import <UIKit/UIKit.h>
#import "JXPage.h"

@class JXFrameManager;

#define JXImageLoading          (JXFrameManager.share.loadingImage)
#define JXImageWaiting          (JXFrameManager.share.waitingImage)
#define JXImageNetwork          (JXFrameManager.share.networkImage)
#define JXImageServer           (JXFrameManager.share.serverImage)
#define JXImageEmpty            (JXFrameManager.share.emptyImage)
#define JXImageExpire           (JXFrameManager.share.expireImage)

@interface JXFrameManager : NSObject
@property (nonatomic, assign) CGFloat fontScale;
@property (nonatomic, strong) JXPage *page;
//@property (nonatomic, strong) UIColor *primaryColor;
@property (nonatomic, strong) UIImage *loadingImage;
@property (nonatomic, strong) UIImage *waitingImage;
@property (nonatomic, strong) UIImage *emptyImage;
@property (nonatomic, strong) UIImage *networkImage;
@property (nonatomic, strong) UIImage *serverImage;
@property (nonatomic, strong) UIImage *expireImage;

+ (instancetype)share;

@end

