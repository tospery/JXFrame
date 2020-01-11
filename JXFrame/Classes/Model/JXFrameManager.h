//
//  JXFrameManager.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import <UIKit/UIKit.h>
#import "JXType.h"

@interface JXFrameManager : NSObject
@property (nonatomic, assign) CGFloat fontScale;
@property (nonatomic, assign) NSInteger pageStart;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) JXPageStyle pageStyle;
@property (nonatomic, strong) UIColor *primaryColor;
@property (nonatomic, strong) UIImage *loadingImage;
@property (nonatomic, strong) UIImage *waitingImage;
@property (nonatomic, strong) UIImage *emptyErrorImage;
@property (nonatomic, strong) UIImage *networkErrorImage;
@property (nonatomic, strong) UIImage *serverErrorImage;
@property (nonatomic, strong) UIImage *expiredErrorImage;

+ (instancetype)share;

@end

