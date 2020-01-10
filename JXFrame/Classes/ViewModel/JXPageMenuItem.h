//
//  JXPageMenuItem.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXCollectionItem.h"
#import "JXType.h"

@interface JXPageMenuItem : JXCollectionItem
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, assign, getter=isSelected) BOOL selected;
@property (nonatomic, assign) CGFloat cellWidth;
@property (nonatomic, assign) CGFloat cellSpacing;
@property (nonatomic, assign, getter=isCellWidthZoomEnabled) BOOL cellWidthZoomEnabled;
@property (nonatomic, assign) CGFloat cellWidthNormalZoomScale;
@property (nonatomic, assign) CGFloat cellWidthCurrentZoomScale;
@property (nonatomic, assign) CGFloat cellWidthSelectedZoomScale;
@property (nonatomic, assign, getter=isSelectedAnimationEnabled) BOOL selectedAnimationEnabled;
@property (nonatomic, assign) NSTimeInterval selectedAnimationDuration;
@property (nonatomic, assign) JXPageMenuCellSelectedType selectedType;
@property (nonatomic, assign, getter=isTransitionAnimating) BOOL transitionAnimating;

@end

