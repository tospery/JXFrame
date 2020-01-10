//
//  JXPageMenuIndicatorLineView.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXPageMenuIndicatorComponentView.h"

typedef NS_ENUM(NSUInteger, JXPageMenuIndicatorLineStyle) {
    JXPageMenuIndicatorLineStyleNormal             = 0,
    JXPageMenuIndicatorLineStyleLengthen           = 1,
    JXPageMenuIndicatorLineStyleLengthenOffset     = 2,
};

@interface JXPageMenuIndicatorLineView : JXPageMenuIndicatorComponentView
@property (nonatomic, assign) JXPageMenuIndicatorLineStyle lineStyle;

/**
 line滚动时x的偏移量，默认为10；
 lineStyle为JXPageMenuIndicatorLineStyleLengthenOffset有用；
 */
@property (nonatomic, assign) CGFloat lineScrollOffsetX;

@end
