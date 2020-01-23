//
//  JXFrameManager.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import <UIKit/UIKit.h>
#import "JXPage.h"

@class JXFrameManager;

@interface JXFrameManager : NSObject
@property (nonatomic, assign) CGFloat fontScale;
@property (nonatomic, strong) JXPage *page;
//@property (nonatomic, strong) UIColor *primaryColor;
@property (nonatomic, strong) UIImage *loadingImage; // YJX_TODO 换到UIImage分类中，通过运行时修改
@property (nonatomic, strong) UIImage *waitingImage;
//@property (nonatomic, strong) UIImage *emptyImage;
//@property (nonatomic, strong) UIImage *networkImage;
//@property (nonatomic, strong) UIImage *serverImage;
//@property (nonatomic, strong) UIImage *expireImage;

+ (instancetype)share;

@end

