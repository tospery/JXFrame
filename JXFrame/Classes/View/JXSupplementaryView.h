//
//  JXSupplementaryView.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import <UIKit/UIKit.h>
#import "JXReactiveView.h"

@interface JXSupplementaryView : UICollectionReusableView <JXReactiveView>
@property (nonatomic, strong, readonly) id viewModel;

- (void)didInitialize;

+ (NSString *)identifier;
+ (CGSize)sizeForSection:(NSInteger)section;

@end

