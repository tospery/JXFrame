//
//  JXWebViewModel.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/8.
//

#import "JXScrollViewModel.h"

@interface JXWebViewModel : JXScrollViewModel
@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic, strong, readonly) UIColor *progressColor;
@property (nonatomic, strong) NSArray *nativeHandlers;
@property (nonatomic, strong) NSArray *jsHandlers;

@end

