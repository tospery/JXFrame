//
//  JXProvider.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/4.
//

#import <UIKit/UIKit.h>
#import "JXProvisionProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXProvider : NSObject <JXProvisionProtocol>

- (void)didInitialize;

+ (instancetype)share;

@end

NS_ASSUME_NONNULL_END
