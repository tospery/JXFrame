//
//  JXPageViewModel.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXScrollViewModel.h"
#import "JXPageContainerView.h"

@class JXPageViewModel;

@protocol JXPageViewModelDataSource <JXScrollViewModelDataSource, JXPageContainerViewDataSource>

@end

@protocol JXPageViewModelDelegate <JXScrollViewModelDelegate>

@end

@interface JXPageViewModel : JXScrollViewModel <JXPageViewModelDataSource>
@property (nonatomic, weak) id<JXPageViewModelDelegate> delegate;

@end

