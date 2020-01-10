//
//  JXPageMenuCollectionView.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import <UIKit/UIKit.h>
#import "JXPageMenuIndicator.h"

@class JXPageMenuCollectionView;

@protocol JXPageMenuCollectionViewGesture <NSObject>
@optional
- (BOOL)collectionView:(JXPageMenuCollectionView *)collectionView gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
- (BOOL)collectionView:(JXPageMenuCollectionView *)collectionView gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;

@end

@interface JXPageMenuCollectionView : UICollectionView
@property (nonatomic, strong) NSArray <UIView<JXPageMenuIndicator> *> *indicators;
@property (nonatomic, weak) id<JXPageMenuCollectionViewGesture> gesture;

@end

