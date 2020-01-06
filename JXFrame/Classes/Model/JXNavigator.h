//
//  JXNavigator.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import <UIKit/UIKit.h>
#import "JXNavigationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXNavigator : NSObject <JXNavigationProtocol>
@property (nonatomic, strong, readonly) UINavigationController *topNavigationController;

- (BOOL)routeURL:(NSURL *)URL;
- (void)pushNavigationController:(UINavigationController *)navigationController;
- (UINavigationController *)popNavigationController;

+ (instancetype)share;

@end

NS_ASSUME_NONNULL_END
